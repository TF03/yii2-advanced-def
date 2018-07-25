{$loc_rating = $rating/20}
<div class="star-rating">
  <div class="star-rating__stars">
    {for $i = 1; $i <= 5; $i++}
      {if $i <= $loc_rating}
      <i class="star-rating__star fa fa-star" title="{$loc_rating} {tlang('out of 5 stars')}"></i>
      {else:}
      <i class="star-rating__star fa fa-star-o" title="{$loc_rating} {tlang('out of 5 stars')}"></i>
      {/if}
    {/for}
  </div>
  <div class="star-rating__votes">
    {tlang('Reviews')}: {$votes}
  </div>
</div>