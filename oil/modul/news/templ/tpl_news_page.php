<div class="content">
    <div class="content__container">
        <!-- Post title -->
        <div class="content__header">
            <h1 class="content__title"><?=$GLOBALS['sql']['zag']?></h1>
        </div>
        <!-- Post description -->
        <div class="content__row">
            <div class="typo">
                <?php if(!empty($GLOBALS['img'])) { ?>
                    <p><?php echo $GLOBALS['img']; ?></p>
                <?php } ?>
                <?=$GLOBALS['sql']['text']?>
            </div>
        </div>

        <!-- Comments -->
<!--        <div class="content__row">-->
<!--            <section class="frame-content">-->
<!--                <div class="frame-content__header">-->
<!--                    <h2 class="frame-content__title">Комментарии</h2>-->
<!--                </div>-->
<!--                <div class="frame-content__inner" data-comments="">-->
<!--                    <div class="comments" data-comments="">-->
<!--                        <div class="comments__list">-->
<!--                            Пока нет ни одного отзыва. Оставьте отзыв первым    </div>-->
<!--                        <div id="comments-anchor"></div>-->
<!--                        <div class="comments__form">-->
<!--                            <div class="comments__form-header">Написать отзыв</div>-->
<!--                            <div class="comments__form-body">-->
<!--                                <form class="form" action="http://demoshop.imagecms.net/comments/addPost#comments-anchor" method="post" data-comments-form="main" data-comments-form-url="http://demoshop.imagecms.net/comments/commentsapi/newPost" data-comments-form-list-url="http://demoshop.imagecms.net/comments/commentsapi/renderPosts">-->
<!--                                    <div class="form__messages hidden" data-comments-error-frame="">-->
<!--                                        <div class="message message--error">-->
<!--                                            <div class="message__list" data-comments-error-list="">-->
<!--                                            </div>-->
<!--                                        </div>-->
<!--                                    </div>-->
<!--                                    <div class="form__messages hidden" data-comments-success="">-->
<!--                                        <p class="message message--success">-->
<!--                                            Ваш комментарий был успешно опубликован          </p>-->
<!--                                    </div>-->
<!--                                    <div class="form__field form__field--hor">-->
<!--                                        <div class="form__label">-->
<!--                                            Имя       <i class="form__require-mark"></i>    </div>-->
<!--                                        <div class="form__inner">-->
<!--                                            <input class="form-control" type="text" name="comment_author" value="" required="">-->
<!--                                        </div>-->
<!--                                    </div>-->
<!--                                    <div class="form__field form__field--hor">-->
<!--                                        <div class="form__label">-->
<!--                                            E-mail       <i class="form__require-mark"></i>    </div>-->
<!--                                        <div class="form__inner">-->
<!--                                            <input class="form-control" type="email" name="comment_email" value="" required="">-->
<!--                                        </div>-->
<!--                                    </div>-->
<!--                                    <div class="form__field form__field--hor">-->
<!--                                        <div class="form__label">-->
<!--                                            Отзыв       <i class="form__require-mark"></i>    </div>-->
<!--                                        <div class="form__inner">-->
<!--                                            <textarea class="form-control" name="comment_text" rows="5" required=""></textarea>-->
<!--                                        </div>-->
<!--                                    </div>-->
<!--                                    <div class="form__field form__field--hor form__field--static" data-comments-form-rating="">-->
<!--                                        <div class="form__label">Рейтинг</div>-->
<!--                                        <div class="form__inner">-->
<!--                                            <div class="star-voting">-->
<!--                                                <div class="star-voting__wrap">-->
<!--                                                    <input class="star-voting__input" id="star-voting-5" type="radio" name="ratec" value="5">-->
<!--                                                    <label class="star-voting__ico" for="star-voting-5" title="5 из 5 звезд"><svg class="svg-icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-icon__star"></use></svg></label>-->
<!--                                                    <input class="star-voting__input" id="star-voting-4" type="radio" name="ratec" value="4">-->
<!--                                                    <label class="star-voting__ico" for="star-voting-4" title="4 из 5 звезд"><svg class="svg-icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-icon__star"></use></svg></label>-->
<!--                                                    <input class="star-voting__input" id="star-voting-3" type="radio" name="ratec" value="3">-->
<!--                                                    <label class="star-voting__ico" for="star-voting-3" title="3 из 5 звезд"><svg class="svg-icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-icon__star"></use></svg></label>-->
<!--                                                    <input class="star-voting__input" id="star-voting-2" type="radio" name="ratec" value="2">-->
<!--                                                    <label class="star-voting__ico" for="star-voting-2" title="2 из 5 звезд"><svg class="svg-icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-icon__star"></use></svg></label>-->
<!--                                                    <input class="star-voting__input" id="star-voting-1" type="radio" name="ratec" value="1">-->
<!--                                                    <label class="star-voting__ico" for="star-voting-1" title="1 из 5 звезд"><svg class="svg-icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-icon__star"></use></svg></label>-->
<!--                                                </div>-->
<!--                                            </div>-->
<!--                                        </div>-->
<!--                                    </div>-->
<!--                                    <div class="form__field form__field--hor">-->
<!--                                        <div class="form__label"></div>-->
<!--                                        <div class="form__inner">-->
<!--                                            <button type="submit" class="btn btn-default">Отправить</button>-->
<!--                                        </div>-->
<!--                                    </div>-->
<!--                                    <input type="hidden" name="action" value="newPost">-->
<!--                                    <input type="hidden" name="comment_parent" value="0" data-comments-parent="">-->
<!--                                    <input type="hidden" value="93085db4d9318b5162deecb138f029eb" name="cms_token"></form>-->
<!--                                <div class="hidden" data-reply-form="">-->
<!--                                    <form class="form" action="http://demoshop.imagecms.net/comments/addPost#comments-anchor" method="post" data-comments-form="reply" data-comments-form-url="http://demoshop.imagecms.net/comments/commentsapi/newPost" data-comments-form-list-url="http://demoshop.imagecms.net/comments/commentsapi/renderPosts">-->
<!--                                        <div class="form__messages hidden" data-comments-error-frame="">-->
<!--                                            <div class="message message--error">-->
<!--                                                <div class="message__list" data-comments-error-list="">-->
<!--                                                </div>-->
<!--                                            </div>-->
<!--                                        </div>-->
<!--                                        <div class="form__messages hidden" data-comments-success="">-->
<!--                                            <p class="message message--success">-->
<!--                                                Ваш комментарий был успешно опубликован              </p>-->
<!--                                        </div>-->
<!--                                        <div class="form__row">-->
<!--                                            <div class="row">-->
<!--                                                <div class="col-sm-6">-->
<!--                                                    <div class="form__field ">-->
<!--                                                        <div class="form__inner">-->
<!--                                                            <input class="form-control" type="text" name="comment_author" value="" placeholder="Имя" required="">-->
<!--                                                        </div>-->
<!--                                                    </div>-->
<!--                                                </div>-->
<!--                                                <div class="col-sm-6 col--spacer-xs">-->
<!--                                                    <div class="form__field ">-->
<!--                                                        <div class="form__inner">-->
<!--                                                            <input class="form-control" type="email" name="comment_email" value="" placeholder="E-mail" required="">-->
<!--                                                        </div>-->
<!--                                                    </div>-->
<!--                                                </div>-->
<!--                                            </div>-->
<!--                                        </div>-->
<!--                                        <div class="form__field ">-->
<!--                                            <div class="form__inner">-->
<!--                                                <textarea class="form-control" name="comment_text" rows="5" placeholder="Отзыв" required=""></textarea>-->
<!--                                            </div>-->
<!--                                        </div>-->
<!--                                        <div class="form__field">-->
<!--                                            <div class="form__inner">-->
<!--                                                <button type="submit" class="btn btn-default">Отправить</button>-->
<!--                                            </div>-->
<!--                                        </div>-->
<!--                                        <input type="hidden" name="action" value="newPost">-->
<!--                                        <input type="hidden" name="comment_parent" value="0" data-comments-parent="">-->
<!--                                        <input type="hidden" value="93085db4d9318b5162deecb138f029eb" name="cms_token">-->
<!--                                    </form>-->
<!--                                </div>-->
<!--                            </div>-->
<!--                        </div>-->
<!--                    </div>            </div>-->
<!--            </section>-->
<!--        </div>-->
    </div>
</div>