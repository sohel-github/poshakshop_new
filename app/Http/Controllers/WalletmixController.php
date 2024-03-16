<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\CustomerPackage;
use App\SellerPackage;
use App\Order;
use App\Cart;
// use Auth;
use App\BusinessSetting;
use App\Seller;
use Session;
use Illuminate\Support\Facades\Auth;

class WalletmixController extends Controller
{
    private $base_url;
    public function __construct()
    {
        if(get_setting('walletmix_live', 1)){
            // $this->base_url = "https://epay.walletmix.com/check-server";
        }
    }
    
    public function pay(){
        
        if(Session::has('payment_type')){
            if(Session::get('payment_type') == 'cart_payment') {
                
                $userId = Auth::id();
                //dd($userId);
                
                $extra_json = "";
                $emi_month = Cart::where('user_id', $userId)->whereNotNull('wmx_emi')->first();

                if($emi_month && $emi_month->wmx_emi > 0){
                    $extra_json = json_encode(['emi_period'=> $emi_month->wmx_emi]);
                }
                
                $order = Order::findOrFail(Session::get('order_id'));
                
                
                $shipping_address = json_decode($order->shipping_address);
                
                $wmx_id = env('WALLETMIX_MERCHANT_ID');
                $merchant_ref_id = uniqid();
                $merchant_order_id = $order->id;
                $app_name = env('WALLETMIX_MERCHANT_DOMAIN');
                $cart_info = "WMX1234567891234,http://example.com,MyApp";
            
                $customer_name = $shipping_address->name;
                $customer_email = $shipping_address->email;
                $customer_address = $shipping_address->address;
                $customer_phone = $shipping_address->phone;
                $product_desc = 'product info';
                $amount = round($order->grand_total);
            
                $currency = "BDT";
                $options = "Cz26kHRwOi8vdGhlbWFsbGJkLmNvbS8saT0zNy4yMjEuMTk1LjE4Ng==";
            
                $wmx_api_access_username = env('WALLETMIX_USER_NAME');
                $wmx_api_access_password = env('WALLETMIX_APP_PASSWORD');
            
                $callback_url = "https://poshakshop.com/wmxpayment";
            
                $access_app_key = env('WALLETMIX_APP_KEY');
                $authorization = "Basic ". base64_encode("$wmx_api_access_username:$wmx_api_access_password");
            
                // 'extra_json',
            
                $post_data = compact('wmx_id', 'merchant_ref_id', 'merchant_order_id', 'app_name', 'cart_info', 'extra_json',
                                    'customer_name', 'customer_email', 'customer_address', 'customer_phone', 'product_desc', 'amount', 'currency',
                                    'options', 'callback_url', 'access_app_key', 'authorization');
                                    
                $curl = curl_init();
                curl_setopt_array($curl, array(
                    CURLOPT_URL => "https://epay.walletmix.com/init-payment-process",
                    CURLOPT_RETURNTRANSFER => 1,
                    CURLOPT_CUSTOMREQUEST => "POST",
                    CURLOPT_POSTFIELDS => $post_data,
                    CURLOPT_FOLLOWLOCATION => 1,
                ));
                $response = curl_exec($curl);
                
                
                $err = curl_error($curl);
                curl_close($curl);
            
                if ($err) {
                    echo "Network Problem...";
                } else {
                    $result = json_decode($response);
                    if ($result->statusCode == 1000) {
                        header("Location: https://epay.walletmix.com/bank-payment-process/" . $result->token);
                    } else {
                        header("Location: https://poshakshop.com/");
                    }
                }
                
            }
            elseif (Session::get('payment_type') == 'wallet_payment') {
                
                $user = Auth::user();
                
                $wmx_id = env('WALLETMIX_MERCHANT_ID');
                $merchant_ref_id = uniqid();
                $merchant_order_id = $user->id;
                $app_name = env('WALLETMIX_MERCHANT_DOMAIN');
                $cart_info = "WMX1234567891234,http://example.com,MyApp";
            
                $customer_name = $user->name;
                $customer_email = $user->email;
                $customer_address = $user->address;
                $customer_phone = $user->phone;
                $product_desc = 'User Wallet Recharge';
                $amount = round(Session::get('payment_data')['amount']);
            
                $currency = "BDT";
                $options = "Cz26kHRwOi8vdGhlbWFsbGJkLmNvbS8saT0zNy4yMjEuMTk1LjE4Ng==";
            
                $wmx_api_access_username = env('WALLETMIX_USER_NAME');
                $wmx_api_access_password = env('WALLETMIX_APP_PASSWORD');
            
                $callback_url = "https://poshakshop.com/wmxpayment";
            
                $access_app_key = env('WALLETMIX_APP_KEY');
                $authorization = "Basic ". base64_encode("$wmx_api_access_username:$wmx_api_access_password");
            
                $post_data = compact('wmx_id', 'merchant_ref_id', 'merchant_order_id', 'app_name', 'cart_info',
                                    'customer_name', 'customer_email', 'customer_address', 'customer_phone', 'product_desc', 'amount', 'currency',
                                    'options', 'callback_url', 'access_app_key', 'authorization');
                                    
                $curl = curl_init();
                curl_setopt_array($curl, array(
                    CURLOPT_URL => "https://epay.walletmix.com/init-payment-process",
                    CURLOPT_RETURNTRANSFER => 1,
                    CURLOPT_CUSTOMREQUEST => "POST",
                    CURLOPT_POSTFIELDS => $post_data,
                    CURLOPT_FOLLOWLOCATION => 1,
                ));
                $response = curl_exec($curl);
                
                
                $err = curl_error($curl);
                curl_close($curl);
            
                if ($err) {
                    echo "Network Problem...";
                } else {
                    $result = json_decode($response);
                    if ($result->statusCode == 1000) {
                        header("Location: https://epay.walletmix.com/bank-payment-process/" . $result->token);
                    } else {
                        header("Location: https://poshakshop.com/");
                    }
                }
                
            }
            elseif (Session::get('payment_type') == 'customer_package_payment') {
                
                $customer_package = CustomerPackage::findOrFail(Session::get('payment_data')['customer_package_id']);
                
                $user = Auth::user();
                
                $wmx_id = env('WALLETMIX_MERCHANT_ID');
                $merchant_ref_id = uniqid();
                $merchant_order_id = $user->id;
                $app_name = env('WALLETMIX_MERCHANT_DOMAIN');
                $cart_info = "WMX1234567891234,http://example.com,MyApp";
            
                $customer_name = $user->name;
                $customer_email = $user->email;
                $customer_address = $user->address;
                $customer_phone = $user->phone;
                $product_desc = $customer_package;
                $amount = round($customer_package->amount);
            
                $currency = "BDT";
                $options = "Cz26kHRwOi8vdGhlbWFsbGJkLmNvbS8saT0zNy4yMjEuMTk1LjE4Ng==";
            
                $wmx_api_access_username = env('WALLETMIX_USER_NAME');
                $wmx_api_access_password = env('WALLETMIX_APP_PASSWORD');
            
                $callback_url = "https://poshakshop.com/wmxpayment";
            
                $access_app_key = env('WALLETMIX_APP_KEY');
                $authorization = "Basic ". base64_encode("$wmx_api_access_username:$wmx_api_access_password");
            
                $post_data = compact('wmx_id', 'merchant_ref_id', 'merchant_order_id', 'app_name', 'cart_info',
                                    'customer_name', 'customer_email', 'customer_address', 'customer_phone', 'product_desc', 'amount', 'currency',
                                    'options', 'callback_url', 'access_app_key', 'authorization');
                                    
                $curl = curl_init();
                curl_setopt_array($curl, array(
                    CURLOPT_URL => "https://epay.walletmix.com/init-payment-process",
                    CURLOPT_RETURNTRANSFER => 1,
                    CURLOPT_CUSTOMREQUEST => "POST",
                    CURLOPT_POSTFIELDS => $post_data,
                    CURLOPT_FOLLOWLOCATION => 1,
                ));
                
                $response = curl_exec($curl);
                $err = curl_error($curl);
                curl_close($curl);
            
                if ($err) {
                    echo "Network Problem...";
                } else {
                    $result = json_decode($response);
                    if ($result->statusCode == 1000) {
                        header("Location: https://epay.walletmix.com/bank-payment-process/" . $result->token);
                    } else {
                        header("Location: https://poshakshop.com/");
                    }
                }
                
            }
            elseif (Session::get('payment_type') == 'seller_package_payment') {
                
                $seller_package = SellerPackage::findOrFail(Session::get('payment_data')['seller_package_id']);
                
                $user = Auth::user();
                
                $wmx_id = env('WALLETMIX_MERCHANT_ID');
                $merchant_ref_id = uniqid();
                $merchant_order_id = $user->id;
                $app_name = env('WALLETMIX_MERCHANT_DOMAIN');
                $cart_info = "WMX1234567891234,http://example.com,MyApp";
            
                $customer_name = $user->name;
                $customer_email = $user->email;
                $customer_address = $user->address;
                $customer_phone = $user->phone;
                $product_desc = $seller_package;
                $amount = round($seller_package->amount);
            
                $currency = "BDT";
                $options = "Cz26kHRwOi8vdGhlbWFsbGJkLmNvbS8saT0zNy4yMjEuMTk1LjE4Ng==";
            
                $wmx_api_access_username = env('WALLETMIX_USER_NAME');
                $wmx_api_access_password = env('WALLETMIX_APP_PASSWORD');
            
                $callback_url = "https://poshakshop.com/wmxpayment";
            
                $access_app_key = env('WALLETMIX_APP_KEY');
                $authorization = "Basic ". base64_encode("$wmx_api_access_username:$wmx_api_access_password");
            
                $post_data = compact('wmx_id', 'merchant_ref_id', 'merchant_order_id', 'app_name', 'cart_info',
                                    'customer_name', 'customer_email', 'customer_address', 'customer_phone', 'product_desc', 'amount', 'currency',
                                    'options', 'callback_url', 'access_app_key', 'authorization');
                                    
                $curl = curl_init();
                curl_setopt_array($curl, array(
                    CURLOPT_URL => "https://epay.walletmix.com/init-payment-process",
                    CURLOPT_RETURNTRANSFER => 1,
                    CURLOPT_CUSTOMREQUEST => "POST",
                    CURLOPT_POSTFIELDS => $post_data,
                    CURLOPT_FOLLOWLOCATION => 1,
                ));
                
                $response = curl_exec($curl);
                $err = curl_error($curl);
                curl_close($curl);
            
                if ($err) {
                    echo "Network Problem...";
                } else {
                    $result = json_decode($response);
                    if ($result->statusCode == 1000) {
                        header("Location: https://epay.walletmix.com/bank-payment-process/" . $result->token);
                    } else {
                        header("Location: https://poshakshop.com/");
                    }
                }
            }
        }
        
    }
    
    
    public function wmxpayment(){
        
        $data = array();
        
        $wmx = json_decode($_POST['merchant_txn_data'], true);
        
        if(isset($wmx)){
            
            $wmx_id = env('WALLETMIX_MERCHANT_ID');
            $wmx_api_access_username = env('WALLETMIX_USER_NAME');
            $wmx_api_access_password = env('WALLETMIX_APP_PASSWORD');
        
            $access_app_key = env('WALLETMIX_APP_KEY');
            $authorization = "Basic ". base64_encode("$wmx_api_access_username:$wmx_api_access_password");
            
            $token = $wmx['token'];
            
            $post_data = compact('wmx_id', 'token','access_app_key', 'authorization');
                            
            $curl = curl_init();
            curl_setopt_array($curl, array(
                CURLOPT_URL => "https://epay.walletmix.com/check-payment",
                CURLOPT_RETURNTRANSFER => 1,
                CURLOPT_CUSTOMREQUEST => "POST",
                CURLOPT_POSTFIELDS => $post_data,
                CURLOPT_FOLLOWLOCATION => 1,
            ));
            $response = curl_exec($curl);
            $err = curl_error($curl);
            curl_close($curl);
            
            if ($err) {
                echo "Network Problem...";
            } else {
                $result = json_decode($response);
                if ($result->txn_status == 1000) {
                    $amount = $result->merchant_amount_bdt;
                    $notes = "Payment Success!";
                    echo '<p style="background: #21b319;color: #fff;padding: 7px 15px;">You payment has been Successful.</p>';
                }else if($result->txn_status == 1009){
                    echo '<p style="background: #b31919;color: #fff;padding: 7px 15px;">Your Payment has been Cancelled</p>';
                }else if($result->txn_status == 1001){
                    echo '<p style="background: #b31919;color: #fff;padding: 7px 15px;">Your Payment has been Rejected</p>';
                }
            }
        }
    }
}