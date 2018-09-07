HTMLWidgets.widget({

  name: 'apexcharter',

  type: 'output',

  factory: function(el, width, height) {

    var ax_opts, chart;

    return {

      renderValue: function(x) {


        // Global options
        ax_opts = x.ax_opts;

        // Sizing
        if (typeof ax_opts.chart === 'undefined') {
          ax_opts.chart = {};
        }
        ax_opts.chart.width = width;
        ax_opts.chart.height = height;

        // Generate chart
        chart = new ApexCharts(document.querySelector("#" + el.id), ax_opts);
        chart.render();

      },
      
      getChart: function(){
        return chart;
      },

      resize: function(width, height) {
        chart.updateOptions({
          chart: {
            width: width,
            height: height
          }
        });
      }

    };
  }
});

// From Friss tuto (https://github.com/FrissAnalytics/shinyJsTutorials/blob/master/tutorials/tutorial_03.Rmd)
function get_widget(id){
  
  // Get the HTMLWidgets object
  var htmlWidgetsObj = HTMLWidgets.find("#" + id);
  
  // Use the getChart method we created to get the underlying billboard chart
  var widgetObj ;
  
  if (typeof htmlWidgetsObj != 'undefined') {
    widgetObj = htmlWidgetsObj.getChart();
  }

  return(widgetObj);
}



if (HTMLWidgets.shinyMode) {
  // data = load
  Shiny.addCustomMessageHandler('update-apexcharts-series',
    function(obj) {
      var chart = get_widget(data.id);
      if (typeof chart != 'undefined') {
        chart.updateSeries(obj.newSeries, obj.animate);
      }
  });
}




