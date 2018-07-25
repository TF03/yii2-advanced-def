<?php

use yii\helpers\Html;

/* @var $this yii\web\View */

$this->title = 'EasyBudget';
?>

<!-- Header -->
<header>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <img class="img-responsive" src="./img/homepage-icon.png" alt="">

                <div class="intro-text">
                    <!--span class="name">EasyBudget</span-->
                    <hr class="star-light">
                    <span class="skills">Лучший проект для ведения семейного бюджета.</span>
                </div>
            </div>
        </div>
    </div>
</header>

<!-- Portfolio Grid Section -->
<section id="info">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-left main-info-block">
                <div class="col-lg-6">
                    <h3>Несколько валют</h3>
                    <p>
                        Для каждого из ваших счетов можно указать свою валюту. В отчетах есть возможность анализа расходов как в разрезе счетов, так и валют.
                    </p>
                </div>
                <div class="col-lg-6">
                    <h3>Разные счета</h3>
                    <p>
                        Создание отдельного счета для ваших наличных денег, банковского счета, кредитных карт, инвестиций, активов и кредитов, чтобы изящно сбалансировать свой учет.
                    </p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- About Section -->
<!--section class="success" id="about">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <h2>About</h2>
                <hr class="star-light">
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 col-lg-offset-2">
                <p>The best project about Budget. The best project about Budget. The best project about Budget.
                    The best project about Budget. The best project about Budget. The best project about Budget.</p>
            </div>
            <div class="col-lg-4">
                <p>The best project about Budget. The best project about Budget. The best project about Budget.
                    The best project about Budget. The best project about Budget. The best project about Budget!</p>
            </div>
            <div class="col-lg-8 col-lg-offset-2 text-center">
                <a href="#" class="btn btn-lg btn-outline">
                    <i class="fa fa-download"></i> Start working with us
                </a>
            </div>
        </div>
    </div>
</section-->

<!-- Contact Section -->
<!--section id="contact">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <h2>Contact Me</h2>
                <hr class="star-primary">
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
                <form name="sentMessage" id="contactForm" novalidate>
                    <div class="row control-group">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <label>Name</label>
                            <input type="text" class="form-control" placeholder="Name" id="name" required
                                   data-validation-required-message="Please enter your name.">

                            <p class="help-block text-danger"></p>
                        </div>
                    </div>
                    <div class="row control-group">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <label>Email Address</label>
                            <input type="email" class="form-control" placeholder="Email Address" id="email" required
                                   data-validation-required-message="Please enter your email address.">

                            <p class="help-block text-danger"></p>
                        </div>
                    </div>
                    <div class="row control-group">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <label>Phone Number</label>
                            <input type="tel" class="form-control" placeholder="Phone Number" id="phone" required
                                   data-validation-required-message="Please enter your phone number.">

                            <p class="help-block text-danger"></p>
                        </div>
                    </div>
                    <div class="row control-group">
                        <div class="form-group col-xs-12 floating-label-form-group controls">
                            <label>Message</label>
                            <textarea rows="5" class="form-control" placeholder="Message" id="message" required
                                      data-validation-required-message="Please enter a message."></textarea>

                            <p class="help-block text-danger"></p>
                        </div>
                    </div>
                    <br>

                    <div id="success"></div>
                    <div class="row">
                        <div class="form-group col-xs-12">
                            <button type="submit" class="btn btn-success btn-lg">Send</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section-->

<!-- Footer -->
<footer class="text-center">
    <div class="footer-above">
        <div class="container">
            <div class="row">
                <div class="footer-col col-md-3 footer-menu">
                    <div class="row">
                        <?= Html::a('Обновления', ['news'])?>
                    </div>
                    <div class="row">
                        <?= Html::a('Контакты', ['contact'])?>
                    </div>
                    <div class="row">
                        <?= Html::a('Политика конфиденциальности', ['privacy'])?>
                    </div>
                </div>
                <div class="footer-col col-md-6">
                    <div id="disqus_thread"></div>
                    <script>
                        /**
                         * RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
                         * LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables
                         */
                        /*
                         var disqus_config = function () {
                         this.page.url = PAGE_URL; // Replace PAGE_URL with your page's canonical URL variable
                         this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
                         };
                         */
                        (function() { // DON'T EDIT BELOW THIS LINE
                            var d = document, s = d.createElement('script');

                            s.src = '//easybudget.disqus.com/embed.js';

                            s.setAttribute('data-timestamp', +new Date());
                            (d.head || d.body).appendChild(s);
                        })();
                    </script>
                    <noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript" rel="nofollow">comments powered by Disqus.</a></noscript>
                </div>
                <div class="footer-col col-md-3">
                    <h4>Следите за новостями</h4>
                    <ul class="list-inline">
                        <li>
                            <a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-vk"></i></a>
                        </li>
                        <li>
                            <a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-facebook"></i></a>
                        </li>
                        <li>
                            <a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-twitter"></i></a>
                        </li>
                        <li>
                            <a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-linkedin"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-below">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    EasyBudget Corporation 2016-<?= date('Y'); ?>
                </div>
            </div>
        </div>
    </div>
</footer>
