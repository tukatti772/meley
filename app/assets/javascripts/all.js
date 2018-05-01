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


/* tutorial画面 
$(document).on('turbolinks:load', function(){
  $('li#tutorial1').click(function(){
    $('div#tutorialtext1').removeClass('invisible');
    $('div#tutorialtext1').addClass('visible');
    $('div#tutorialtext2').removeClass('visible');
    $('div#tutorialtext2').addClass('invisible');
    $('div#tutorialtext3').removeClass('visible');
    $('div#tutorialtext3').addClass('invisible');
  }); //end click //

  $('li#tutorial2').click(function(){
    $('div#tutorialtext1').removeClass('visible');
    $('div#tutorialtext1').addClass('invisible');
    $('div#tutorialtext2').removeClass('invisible');
    $('div#tutorialtext2').addClass('visible');
    $('div#tutorialtext3').removeClass('visible');
    $('div#tutorialtext3').addClass('invisible');
  }); // end click //

  $('li#tutorial3').click(function(){
    $('div#tutorialtext1').removeClass('visible');
    $('div#tutorialtext1').addClass('invisible');
    $('div#tutorialtext2').removeClass('visible');
    $('div#tutorialtext2').addClass('invisible');
    $('div#tutorialtext3').removeClass('invisible');
    $('div#tutorialtext3').addClass('visible');
  }); // end click //
}); // end function //
*/
