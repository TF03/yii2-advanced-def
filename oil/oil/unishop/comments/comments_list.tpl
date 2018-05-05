{foreach $comments_arr as $comment}
<div class="comments__post" data-comments-post="{$comment.id}">
  <div class="comments__post-header">
    <h3 class="comments__post-author">{$comment.user_name}</h3>
    <time class="comments__post-date" datetime="{date('Y-m-d\TH:i', $comment.date)}">{tpl_locale_date("d F Y H:i", $comment.date)}</time>
    <div class="comments__post-rate">
      <div class="star-rating">
        {for $i = 1; $i <= 5; $i++}
          {if $i <= $comment.rate}
          <i class="star-rating__star fa fa-star" title="{$comment.rate} {tlang('out of 5 stars')}"></i>
          {else:}
          <i class="star-rating__star fa fa-star-o" title="{$comment.rate} {tlang('out of 5 stars')}"></i>
          {/if}
        {/for}
      </div>
    </div>
  </div>
  <div class="comments__post-text">{$comment.text}</div>
  <div class="comments__post-footer">
    <div class="comments__post-vote">
      <a class="comments__post-vote-item" href="{site_url('comments/setyes/'.$comment.id)}" title="{tlang('Like')}"
         data-comments-vote-url="{site_url('comments/commentsapi/setyes')}"
      >
        <i class="comments__post-vote-ico fa fa-thumbs-o-up"></i>
        <span class="comments__post-vote-count" data-comments-vote-value>{$comment.like}</span>
      </a>
      <a class="comments__post-vote-item" href="{site_url('comments/setno/'. $comment.id)}" title="{tlang('Dislike')}"
         data-comments-vote-url="{site_url('comments/commentsapi/setno')}"
      >
        <i class="comments__post-vote-ico fa fa-thumbs-o-down"></i>
        <span class="comments__post-vote-count" data-comments-vote-value>{$comment.disslike}</span>
      </a>
    </div>
    {if $can_comment != 1 || $is_logged_in}
    <div class="comments__post-reply">
      <button class="comments__post-reply-link" data-comments-reply-link>{tlang('Reply to this post')}</button>
    </div>
    {/if}
  </div>  
  <div class="comments__post-reply-form hidden" data-comments-form-wrapper></div>
  <!-- Parent comments (reply to comments) list -->
  {view('comments/reply_list.tpl', [
    'comment' => $comment
  ])}
</div>
{/foreach}