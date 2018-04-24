/* 検索フォーム切り替え */

$(document).on('turbolinks:load', function(){
  $('button#searchbar').click(function(){
     $('input#searchbox').attr('placeholder','投稿検索');
     $('form#searchform').attr('action','/dairy/search');
     $('button#searchbar').attr('class','btn btn-success active');
     $('button#searchbar2').attr('class','btn');
  }); /* end click */
}); /* end function */

$(document).on('turbolinks:load', function(){
  $('button#searchbar2').click(function(){
     $('input#searchbox').attr('placeholder','ユーザー検索');
     $('form#searchform').attr('action','/dairy/usersearch');
     $('button#searchbar2').attr('class','btn btn-success active');
     $('button#searchbar').attr('class','btn');
  }); /* end click */
}); /* end function */


