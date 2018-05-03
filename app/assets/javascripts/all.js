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


//チュートリアルのスクロール//
$(document).on('turbolinks:load', function(){
  $('.tutorial').click(function(){
    var i = $('.tutorial').index(this); //別にidを使えば良いが、indexとeqの組み合わせで指定する技術//
    var p = $('.tutorialtext').eq(i).offset().top; //でもidを使うよりも、行数は少なくてすみそう//
    $('html,body').animate({scrollTop: p },'fast');
    return false;
  });
});

$(document).on('turbolinks:load', function(){
  $('.backtotop').click(function(){
    $('html,body').animate({scrollTop: 0 },'fast');
    return false;
  });
});

//自作のwysiwyg用. onsubmitで呼び出す関数//
function copytext(){
        var x1 = $('#wysitext1').html(); //contenteditableの内容を読み取りx1に入れる//
        return $('#posttext1').val(x1); //textarea id=posttext1にx1を代入して、returnで返り値を取得する//
     }


//投稿画面の色のパレットの出し入れ//
$(document).on('turbolinks:load', function(){
  $('#slidebutton').hide();        //色のパネルを非表示にする
  $('#colorbtn').click(function(e){
    var d = $('#slidebutton');
    if (d.css('display') === 'block'){
      d.slideUp(300);
    } else {
      d.slideDown(300);
    }   //end if
   });  // end click function
}); // end function


//投稿画面のlink入力画面の出し入れ//
$(document).on('turbolinks:load', function(){
  $('#inserturl').hide();        //色のパネルを非表示にする
  $('#linkbtn').click(function(){
    var e = $('#inserturl');
    if (e.css('display') === 'block'){
      e.slideUp(300);
    } else {
      e.slideDown(300);
    }   //end if
   });  // end click function
}); // end function


//投稿欄のlinkボタンクリック時の関数//
function makelink(){
  var link = $("#inputurl").val();
  document.execCommand('createLink', false, link);
 }



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
