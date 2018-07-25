<div class="content">
    <div class="content__container">
        <div class="row">
            <!-- Left BEGIN -->
            <div class="col-sm-4 col-md-3 col-lg-2">
                <!-- Sub categories -->
                <div class="hidden-xs">
                    <div class="content__sidebar-item">
                        <?php if (!empty($GLOBALS['parentCategories'])) { ?>
                            <ul class="sidebar-nav">
                                <?php echo $GLOBALS['parentCategories'];?>
                            </ul>
                        <?php } ?>
                    </div>
                </div>

                <!-- Filter toggle button on mobile devices -->
                <div class="content__sidebar-item visible-xs">
                    <button class="btn btn-default btn-block" data-filter-toggle--btn="">
                        <span data-filter-toggle--btn-text="">Показать фильтр <i
                                class="btn-default__ico btn-default__ico--down">
                                <svg class="svg-icon">
                                    <use xmlns:xlink="http://www.w3.org/1999/xlink"
                                         xlink:href="#svg-icon__arrow-down"></use>
                                </svg>
                            </i></span>
                        <span class="hidden" data-filter-toggle--btn-text="">Спрятать фильтр <i
                                class="btn-default__ico btn-default__ico--top">
                                <svg class="svg-icon">
                                    <use xmlns:xlink="http://www.w3.org/1999/xlink"
                                         xlink:href="#svg-icon__arrow-top"></use>
                                </svg>
                            </i></span>
                    </button>
                </div>

                <!-- Filter -->
                <div class="hidden-xs" data-filter-toggle--filter="">
                    <div class="content__sidebar-item">
                        <div class="filter" data-filter=""
                             data-filter-category="http://demoshop.imagecms.net/shop/category/elektronika">

                            <!-- Brands -->
                            <div class="filter__item" data-filter-name="brand" data-filter-position="0">
                                <div class="filter__header">
                                    <div class="filter__title">Бренд</div>
                                </div>
                                <div class="filter__inner">
                                    <label class="filter__checkgroup">
                                          <span class="filter__checkgroup-control">
                                            <input type="checkbox" name="brand[]" form="catalog-form" value="276" data-filter-control="brand-apple"
                                                   data-filter-alias="apple">
                                          </span>
                                          <span class="filter__checkgroup-title ">
                                            Apple          </span>
                                          <span class="filter__checkgroup-count">
                                            (1)
                                          </span>
                                    </label>
                                    <label class="filter__checkgroup">
                                          <span class="filter__checkgroup-control">
                                            <input type="checkbox" name="brand[]" form="catalog-form" value="277" data-filter-control="brand-asus"
                                                   data-filter-alias="asus">
                                          </span>
                                          <span class="filter__checkgroup-title ">
                                            Asus          </span>
                                          <span class="filter__checkgroup-count">
                                            (2)
                                          </span>
                                    </label>
                                    <label class="filter__checkgroup">
                                          <span class="filter__checkgroup-control">
                                            <input type="checkbox" name="brand[]" form="catalog-form" value="278" data-filter-control="brand-goodram"
                                                   data-filter-alias="goodram">
                                          </span>
                                          <span class="filter__checkgroup-title ">
                                            Goodram          </span>
                                          <span class="filter__checkgroup-count">
                                            (2)
                                          </span>
                                    </label>
                                    <label class="filter__checkgroup">
                                          <span class="filter__checkgroup-control">
                                            <input type="checkbox" name="brand[]" form="catalog-form" value="280" data-filter-control="brand-htc"
                                                   data-filter-alias="htc">
                                          </span>
                                          <span class="filter__checkgroup-title ">
                                            HTC          </span>
                                          <span class="filter__checkgroup-count">
                                            (1)
                                          </span>
                                    </label>
                                    <label class="filter__checkgroup">
                                          <span class="filter__checkgroup-control">
                                            <input type="checkbox" name="brand[]" form="catalog-form" value="275" data-filter-control="brand-impression"
                                                   data-filter-alias="impression">
                                          </span>
                                          <span class="filter__checkgroup-title ">
                                            Impression          </span>
                                          <span class="filter__checkgroup-count">
                                            (1)
                                          </span>
                                    </label>
                                    <label class="filter__checkgroup">
                                          <span class="filter__checkgroup-control">
                                            <input type="checkbox" name="brand[]" form="catalog-form" value="284" data-filter-control="brand-lenovo"
                                                   data-filter-alias="lenovo">
                                          </span>
                                          <span class="filter__checkgroup-title ">
                                            Lenovo          </span>
                                          <span class="filter__checkgroup-count">
                                            (1)
                                          </span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END Left -->

            <!-- Center BEGIN -->
            <div class="col-sm-8 col-md-9 col-lg-10">
                <!-- Category title -->
                <div class="content__header">
                    <h1 class="content__title"><?php echo $GLOBALS['category_info']['name'];?></h1>
                    <span class="content__hinfo">Найдено:
                          <i class="content__hinfo-number">1</i> - <i class="content__hinfo-number">9</i> из <i class="content__hinfo-number">9</i>
                            товаров
                    </span>
                </div>

                <!-- Products order and view change -->
                <div class="content__row content__row--sm">
                    <div class="catalog-toolbar">
                        <div class="row">
                            <!-- Order BEGIN -->
                            <div class="col-sm-6">
                                <div class="catalog-toolbar__item">
                                    <div class="catalog-toolbar__label hidden-xs">Сортировать по</div>
                                    <div class="catalog-toolbar__field">
                                        <select class="form-control input-sm" form="catalog-form" name="order"
                                                data-catalog-order-select="">
                                            <option value="action" selected="" data-catalog-default="">Акции</option>
                                            <option value="price">От дешевих к дорогим</option>
                                            <option value="price_desc">От дорогих к дешевим</option>
                                            <option value="hit">Популярние</option>
                                            <option value="rating">Рейтинг</option>
                                            <option value="hot">Новинки</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <!-- END Order -->
                        </div>
                    </div>
                </div>
                <!-- Filter selected results -->

                <!-- Product list -->
                <div class="content__row">
                    <!-- Table, card view. Default view -->
                    <div class="content__row content__row--top-md">
                        <div class="row row--ib row--vindent-m">
                            <?php if (!empty($GLOBALS['categoryProducts'])) { ?>
                                <?php echo $GLOBALS['categoryProducts']; ?>
                                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                    <article class="product-cut " data-product-scope="">
                                        <!-- Block visible once page is loaded -->
                                        <div class="product-cut__main-info">
                                            <!-- Photo output BEGIN -->
                                            <div class="product-cut__photo">
                                                <div class="product-photo">
                                                    <button class="product-photo__item product-photo__item--md"
                                                            type="button"
                                                            data-product-photo-href="http://demoshop.imagecms.net/shop/product/asus-transformer-book-t100ta">
                                                        <img class="product-photo__img"
                                                             src="/uploads/shop/products/medium/bff453f14734bedc7e1231908a9d1aea.jpg"
                                                             alt="Энергоэкономный ноутбук два в одном - ASUS Transformer Book"
                                                             title="Энергоэкономный ноутбук два в одном - ASUS Transformer Book"
                                                             data-product-photo=""></button>
                                                </div>
                                            </div>

                                            <!-- Rating and reviews BEGIN -->
                                            <div class="product-cut__rating">
                                                <div class="star-rating">
                                                    <div class="star-rating__stars">
                                                        <i class="star-rating__star " title="0 из 5 звезд">
                                                            <svg class="svg-icon">
                                                                <use xmlns:xlink="http://www.w3.org/1999/xlink"
                                                                     xlink:href="#svg-icon__star"></use>
                                                            </svg>
                                                        </i>
                                                        <i class="star-rating__star " title="0 из 5 звезд">
                                                            <svg class="svg-icon">
                                                                <use xmlns:xlink="http://www.w3.org/1999/xlink"
                                                                     xlink:href="#svg-icon__star"></use>
                                                            </svg>
                                                        </i>
                                                        <i class="star-rating__star " title="0 из 5 звезд">
                                                            <svg class="svg-icon">
                                                                <use xmlns:xlink="http://www.w3.org/1999/xlink"
                                                                     xlink:href="#svg-icon__star"></use>
                                                            </svg>
                                                        </i>
                                                        <i class="star-rating__star " title="0 из 5 звезд">
                                                            <svg class="svg-icon">
                                                                <use xmlns:xlink="http://www.w3.org/1999/xlink"
                                                                     xlink:href="#svg-icon__star"></use>
                                                            </svg>
                                                        </i>
                                                        <i class="star-rating__star " title="0 из 5 звезд">
                                                            <svg class="svg-icon">
                                                                <use xmlns:xlink="http://www.w3.org/1999/xlink"
                                                                     xlink:href="#svg-icon__star"></use>
                                                            </svg>
                                                        </i>
                                                    </div>
                                                    <div class="star-rating__votes">
                                                        <a class="star-rating__votes-link"
                                                           href="http://demoshop.imagecms.net/shop/product/asus-transformer-book-t100ta#comments-list">Отзывы:
                                                            2</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Title BEGIN -->
                                            <div class="product-cut__title">
                                                <a class="product-cut__title-link"
                                                   href="http://demoshop.imagecms.net/shop/product/asus-transformer-book-t100ta">Энергоэкономный
                                                    ноутбук два в одном - ASUS Transformer Book</a>
                                            </div>
                                            <!-- If product is not archived -->
                                            <!-- Product price -->
                                            <div class="product-cut__price">
                                                <div class="product-price product-price--bg">
                                                    <!-- Discount -->
                                                    <!-- Main Price -->
                                                    <div class="product-price__item">
                                                        <div class="product-price__main">
                                                            <span class="product-price__item-cur">$</span><span
                                                                class="product-price__item-value"
                                                                data-product-price--main="data-product-price--main">1 220</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Delete item from wishlist -->

                                            <!-- Move item between wishlists -->

                                            <!-- If archived product -->

                                            <!-- Block hidden at once, visible on hover -->
                                            <div class="product-cut__extra-info">
                                                <div class="product-cut__actions">
                                                    <div class="product-cut__action-item">
                                                        <!-- Product "add to cart" and "already in cart" buttons -->
                                                        <div class="product-buy">
                                                            <!-- Items in stock -->
                                                            <div class="product-buy__available  " data-product-available="">
                                                                <form
                                                                    action="http://demoshop.imagecms.net/shop/cart/addProductByVariantId/17976"
                                                                    method="get" data-product-button--form=""
                                                                    data-product-button--path="http://demoshop.imagecms.net/shop/cart/api/addProductByVariantId"
                                                                    data-product-button--variant="17976"
                                                                    data-product-button--modal-url="http://demoshop.imagecms.net/shop/cart"
                                                                    data-product-button--modal-template="includes/cart/cart_modal">

                                                                    <!-- Input product quantity, you wish to buy -->

                                                                    <!-- Add to cart button -->
                                                                    <div class="product-buy__buttons "
                                                                         data-product-button--add=""
                                                                         data-product-button-item="">
                                                                        <button
                                                                            class="product-buy__btn product-buy__btn--buy"
                                                                            type="submit" data-product-button--loader="">
                                                                            <span>Купить</span>
                                                                            <i class="button--loader hidden"
                                                                               data-button-loader="loader">
                                                                                <svg class="svg-icon">
                                                                                    <use
                                                                                        xmlns:xlink="http://www.w3.org/1999/xlink"
                                                                                        xlink:href="#svg-icon__refresh"></use>
                                                                                </svg>
                                                                            </i>
                                                                        </button>
                                                                    </div>
                                                                    <!-- Already in cart button -->
                                                                    <div class="product-buy__buttons hidden"
                                                                         data-product-button--view=""
                                                                         data-product-button-item="">
                                                                        <a class="product-buy__btn product-buy__btn--in-cart"
                                                                           href="http://demoshop.imagecms.net/shop/cart"
                                                                           data-modal="includes/cart/cart_modal">В
                                                                            корзине</a>
                                                                    </div>

                                                                    <input type="hidden" name="redirect" value="cart">
                                                                    <input type="hidden"
                                                                           value="93085db4d9318b5162deecb138f029eb"
                                                                           name="cms_token"></form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                </div>
                            <?php } else { ?>
                                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">Товаров не найдено</div>
                            <?php } ?>
                        </div>
                    </div>
                    <!-- Category pagination -->
                </div>
                <!-- Category description -->
            </div>
            <!-- /.col -->
            <!-- END Center -->
        </div>
    </div>
    <!-- /.content__container -->
</div>
