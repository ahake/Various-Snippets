javascript:function url() {
  var date = new Date();
  var y = date.getFullYear();
  var m = date.getMonth() + 1;
  if (m < 10) {
    m = '0' + m;
  }
  var d = date.getDate();
  if (d < 10) {
    d = '0' + d;
  }
  var date = y + '/' + m + '/' + d;

  return (
    'https://digital-print-edition.austcommunitymedia.com.au/BMM/' +
    date +
    '/3dissue/index.html'
  );
}
window.open(url(), '_blank');

// Leave the javascript bookmark on line 1 to copy and paste it straight into a bookmark
