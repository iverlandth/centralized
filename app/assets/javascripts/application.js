// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require cable

//= require js/flat-ui.min
//= require js/vendor/html5shiv
//= require js/vendor/respond.min
//= require leaflet


$(document).on('ready page:load', function (event) {

    // Custom Selects
    if ($('[data-toggle="select"]').length) {
        $('[data-toggle="select"]').select2();
    }

    // Checkboxes and Radio buttons
    $('[data-toggle="checkbox"]').radiocheck();
    $('[data-toggle="radio"]').radiocheck();

    // Tooltips
    $('[data-toggle=tooltip]').tooltip('show');

});

// Some general UI pack related JS
// Extend JS String with repeat method
String.prototype.repeat = function (num) {
    return new Array(Math.round(num) + 1).join(this);
};

(function ($) {

    // Add segments to a slider
    $.fn.addSliderSegments = function () {
        return this.each(function () {
            var $this = $(this),
                option = $this.slider('option'),
                amount = (option.max - option.min)/option.step,
                orientation = option.orientation;
            if ( 'vertical' === orientation ) {
                var output = '', i;
                console.log(amount);
                for (i = 1; i <= amount - 1; i++) {
                    output += '<div class="ui-slider-segment" style="top:' + 100 / amount * i + '%;"></div>';
                }
                $this.prepend(output);
            } else {
                var segmentGap = 100 / (amount) + '%';
                var segment = '<div class="ui-slider-segment" style="margin-left: ' + segmentGap + ';"></div>';
                $this.prepend(segment.repeat(amount - 1));
            }
        });
    };

    $(function () {

        // Todo list
        $('.todo').on('click', 'li', function () {
            $(this).toggleClass('todo-done');
        });

        // jQuery UI Sliders
        var $slider = $('#slider');
        if ($slider.length > 0) {
            $slider.slider({
                max: 15,
                step: 6,
                value: 3,
                orientation: 'horizontal',
                range: 'min'
            }).addSliderSegments();
        }

        var $verticalSlider = $('#vertical-slider');
        if ($verticalSlider.length) {
            $verticalSlider.slider({
                min: 1,
                max: 5,
                value: 3,
                orientation: 'vertical',
                range: 'min'
            }).addSliderSegments($verticalSlider.slider('option').max, 'vertical');
        }

        // Focus state for append/prepend inputs
        $('.input-group').on('focus', '.form-control', function () {
            $(this).closest('.input-group, .form-group').addClass('focus');
        }).on('blur', '.form-control', function () {
            $(this).closest('.input-group, .form-group').removeClass('focus');
        });

        // Make pagination demo work
        $('.pagination').on('click', 'a', function () {
            $(this).parent().siblings('li').removeClass('active').end().addClass('active');
        });

        $('.btn-group').on('click', 'a', function () {
            $(this).siblings().removeClass('active').end().addClass('active');
        });

        // Disable link clicks to prevent page scrolling
        $(document).on('click', 'a[href="#fakelink"]', function (e) {
            e.preventDefault();
        });

        // Switches
        if ($('[data-toggle="switch"]').length) {
            $('[data-toggle="switch"]').bootstrapSwitch();
        }

        // Typeahead
        if ($('#typeahead-demo-01').length) {
            var states = new Bloodhound({
                datumTokenizer: function (d) { return Bloodhound.tokenizers.whitespace(d.word); },
                queryTokenizer: Bloodhound.tokenizers.whitespace,
                limit: 4,
                local: [
                    { word: 'Alabama' },
                    { word: 'Alaska' },
                    { word: 'Arizona' },
                    { word: 'Arkansas' },
                    { word: 'California' },
                    { word: 'Colorado' }
                ]
            });

            states.initialize();

            $('#typeahead-demo-01').typeahead(null, {
                name: 'states',
                displayKey: 'word',
                source: states.ttAdapter()
            });
        }

        // make code pretty
        window.prettyPrint && prettyPrint();

    });

})(jQuery);
