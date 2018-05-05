<div class="star-rating">
  <div class="star-rating__stars">
    {for $i = 1; $i <= 5; $i++}
      {if $i <= $model->getRating()}
        <i class="star-rating__star fa fa-star" title="{echo $model->getRating()} {tlang('out of 5 stars')}"></i>
      {else:}
        <i class="star-rating__star fa fa-star-o" title="{echo $model->getRating()} {tlang('out of 5 stars')}"></i>
      {/if}
    {/for}
  </div>
  <div class="star-rating__votes">
    <a class="star-rating__votes-link" href="{shop_url('product/'.$model->getUrl())}#comments-list">{tlang('Reviews')}: {echo $model->getVotes()}</a>
  </div>
</div>