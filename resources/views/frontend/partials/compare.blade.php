{{-- <a href="{{ route('compare') }}" class="d-flex align-items-center text-reset pr-2">
    <div class="compare">
        <i class="la la-refresh la-2x opacity-80"></i>
        <div class="compare_content">
            <div class="fs-12">
                <span class="fw-600 text-primary">Compare</span>
            </div>
            <div class="fs-10">
                @if(Session::has('compare'))
                    <span class="fw-400 text-primary">{{ count(Session::get('compare'))}} items</span>
                @else
                    <span class="fw-400 text-primary">0 items</span>
                @endif
            </div>
        </div>
    </div>
</a> --}}

<a href="#" class="d-flex align-items-center text-reset pr-2">
    <div class="compare">
        <div class="compare_content">
            <div class="fs-12 nav-cus-drop">
                <span class="fw-600 text-primary">Need Help?</span>
                <div class="my-drop">
                    <ul>
                        <li id="drop-top">
                            <a href="tel:+ 8801711663381" class="d-flex align-items-center text-reset pr-2">
                                <div class="compare">
                                    <i class="la la-phone la-2x"></i>
                                    <div class="compare_content">
                                        <div class="fs-12">
                                            <span class="fw-600">Call us now</span>
                                        </div>
                                        <div class="fs-10">
                                            <span class="fw-400">+ 88 01711663381</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="fw-600 text-primary">About us</a>
                        </li>
                        <li>
                            <a href="#" class="fw-600 text-primary">How to shop on Poshakshop</a>
                        </li>
                        <li>
                            <a href="{{ route('returnpolicy') }}" class="fw-600 text-primary">Return Policy</a>
                        </li>
                        <li>
                            <span class="fw-600 text-primary">Track Your Order</span>
                            <form action="{{ route('orders.track') }}" method="GET" enctype="multipart/form-data">
                                <input type="text" class="form-control mb-1" placeholder="{{ translate('Order Code')}}" name="order_code" required />
                                <div class="input-group-append">
                                    <button class="btn btn-primary btn-block" type="submit">Track</button>
                                </div>
                            </form>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</a>