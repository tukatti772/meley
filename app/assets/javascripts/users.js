/*railsではturbolinksが効いており、初回アクセス以降はアセットを使い回しているので、
ブラウザバックなどの際に'load'イベントが着火しない。
したがってturbolinks:loadイベントを記載する。
するとturbolinksによるページ遷移の際に着火するようになる。*/

/*

$(window).on('turbolinks:load', function(){
 $("li").on("click", function(){
    $("li.selected").removeClass("selected");
    $(this).addClass("selected");
    $(".contents div").hide();
    $("." + this.id).show();
  });
});

*/


/*

paginationを2つ使うと、片方をページ遷移した時に、
元のcssに更新されてタブの選択が元に戻ってしまう。
なので、javascriptを使わず、2つのページで表示することとした。

*/