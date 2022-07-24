<!-- JAVASCRIPT -->
<script src="<%=basePath%>/assets/libs/jquery/jquery.min.js"></script>
<script src="<%=basePath%>/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="<%=basePath%>/assets/libs/metismenu/metisMenu.min.js"></script>
<script src="<%=basePath%>/assets/libs/simplebar/simplebar.min.js"></script>
<script src="<%=basePath%>/assets/libs/node-waves/waves.min.js"></script>

<script src="<%=basePath%>/assets/libs/sweetalert2/sweetalert2.min.js"></script>
<script src="<%=basePath%>/assets/js/pages/sweet-alerts.init.js"></script>
<!-- apexcharts -->
<script src="<%=basePath%>/assets/libs/apexcharts/apexcharts.min.js"></script>

<!-- Required datatable js -->
<script src="<%=basePath%>/assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>/assets/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>

<!-- Buttons examples -->
<script src="<%=basePath%>/assets/libs/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script src="<%=basePath%>/assets/libs/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js"></script>
<script src="<%=basePath%>/assets/libs/jszip/jszip.min.js"></script>
<script src="<%=basePath%>/assets/libs/pdfmake/build/pdfmake.min.js"></script>
<script src="<%=basePath%>/assets/libs/pdfmake/build/vfs_fonts.js"></script>
<script src="<%=basePath%>/assets/libs/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script src="<%=basePath%>/assets/libs/datatables.net-buttons/js/buttons.print.min.js"></script>
<script src="<%=basePath%>/assets/libs/datatables.net-buttons/js/buttons.colVis.min.js"></script>

<script src="<%=basePath%>/assets/libs/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
<script src="<%=basePath%>/assets/libs/datatables.net-select/js/dataTables.select.min.js"></script>


<!-- Responsive examples -->
<script src="<%=basePath%>/assets/libs/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script src="<%=basePath%>/assets/libs/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>

<script src="<%=basePath%>/assets/js/pages/dashboard.init.js"></script>
<script src="<%=basePath%>/assets/libs/chart.js/Chart.bundle.min.js"></script>
<script src="<%=basePath%>/assets/js/pages/chartjs.init.js"></script>
<!-- App js -->
<script src="<%=basePath%>/assets/js/app.js"></script>
<script>
    function search(){
        var searchStr = $('#searchStr').val().trim();
        if(searchStr === "" || null){
            $('#btn-search-btn').attr('disabled',"true");
        }else{
            $('#btn-search-btn').removeAttr('disabled');
        }
    }

//sweetAlert Update user record
   /* $('#update-record').on('click', function (e) {
        e.preventDefault();
        window.url = $(this).attr('href');
        swal.fire({
            title: 'Are you sure?',
            text: "Proceed to update your info!",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Confirm',
            padding: '2em'
        },function(){
            swal.fire("Deleted!", "Your details has been deleted!", "success");
        }).then(function (result) {
            if (result.value) {
                console.log(window.url);
                window.location.href = window.url;
            }
        });
    });
    //sweetAlert delete user record
    $('#delete-record').on('click', function (e) {
        e.preventDefault();
        window.url = $(this).attr('href');
        swal.fire({
            title: 'Are you sure to proceed?',
            text: "You won't be able to revert this!",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#3085d6',
            confirmButtonText: 'Delete',
            padding: '2em'
        }).then(function (result) {
            if (result.value) {
                console.log(window.url);
                window.location.href = window.url;
            }
        });
    });*/
</script>
<script>
    var username_items, username_item = [];
    var freq_items, freq_item = [];

    username_items = document.getElementsByClassName("userlog_cell_username");
    freq_items = document.getElementsByClassName("userlog_cell_frequency");

    for(var i = 0; i < username_items.length; i++){
        username_item.push(username_items[i].innerHTML);
    }


    for(var i = 0; i < freq_items.length; i++){
        freq_item.push(freq_items[i].innerHTML);
    }

    var ctx = document.getElementById('userLog_barChart').getContext("2d"); //rendering the bar chart as a 2d object
    var barChart =  new Chart(ctx, {
        type: "bar",
        data: {
            labels: username_item,
            datasets:[{
                label: 'User login times',
                backgroundColor: [
                    'rgba(255, 99, 132, 0.8)',
                    'rgba(54, 162, 235, 0.8)',
                    'rgba(255, 206, 86, 0.8)',
                    'rgba(75, 192, 192, 0.8)',
                    'rgba(153, 102, 255, 0.8)',
                    'rgba(255, 159, 64, 0.8)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1,
                data: freq_item,
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });


    var gender, gender_items = [];
    var gender_numbers, gender_num = [];

    gender = document.getElementsByClassName("userLog_gender_cell");
    gender_numbers = document.getElementsByClassName("userLog_gender_num");

    for (var i = 0; i < gender.length; i++){
        gender_items.push(gender[i].innerHTML);
    }

    for (var i = 0; i < gender_numbers.length; i++){
        gender_num.push(Number(gender_numbers[i].innerHTML));
    }

    var pie_ctx = document.getElementById("userlog_gender_pieChart").getContext("2d");
    var myPieChart = new Chart( pie_ctx, {
        type: "pie",
        data: {
            labels: gender_items,
            datasets: [{
                label: "The gender distribution of registered users",
                backgroundColor: [
                    'rgba(75, 192, 192, 1)',
                    'rgba(255, 99, 132, 1)'
                ],
                borderColor: [
                    'rgb(255, 255, 255)',
                    'rgb(255, 255, 255)'
                ],
                borderWidth: 1,
                data: gender_num,
            }]
        },
            options: {
            }
    });

    var today, todays =[];
    var yesterday, yesterdays = [];
    var dayBefore, day_before = [];
    var threeDaysAgo,three_DaysAgo = [];
    var fourDaysAgo, four_DaysAgo = [];

    today = document.getElementsByClassName("todayLogins");
    yesterday = document.getElementsByClassName("yesterdayLogins");
    dayBefore = document.getElementsByClassName("dayBeforeLogins");
    threeDaysAgo  = document.getElementsByClassName("3daysAgoLogins");
    fourDaysAgo = document.getElementsByClassName("4DaysAgoLogins");

    for (var i = 0; i < today.length; i++){
        todays.push(Number(today[i].innerHTML));
    }

    for (var i = 0; i < yesterday.length; i++){
        yesterdays.push(Number(yesterday[i].innerHTML));
    }

    for (var i = 0; i < dayBefore.length; i++){
        day_before.push(Number(dayBefore[i].innerHTML));
    }

    for (var i = 0; i < threeDaysAgo.length; i++){
        three_DaysAgo.push(Number(threeDaysAgo[i].innerHTML));
    }

    for (var i = 0; i < fourDaysAgo.length; i++){
        four_DaysAgo.push(Number(fourDaysAgo[i].innerHTML));
    }
    var barColors = [
        "rgb(28, 187, 140)",
        "rgb(15, 156, 243)",
        "rgb(252, 185, 44)",
        "rgb(74, 163, 255)",
        "rgb(243, 47, 83)"
    ];
    var yValues = [todays, yesterdays, day_before, three_DaysAgo, four_DaysAgo];
    var doughnut_chart = document.getElementById("logins_data_chart").getContext("2d");
    var myDoughnutChart = new Chart( doughnut_chart, {
       type: "doughnut",
        data: {
            labels: ['Today', 'Yesterday', '2 Days Ago', '3 Days Ago', '4 Days Ago'],
            datasets: [{
                label: "Total Logins",
               backgroundColor: barColors,
                data: yValues,
            }]
        },
        options: {
        }
    });

    var name, username = [];
    var active, activeTime = [];

    name = document.getElementsByClassName("username_Per_ActiveTime");
    active = document.getElementsByClassName("userLog_ActiveTime_Data");

    for(var i = 0; i<name.length; i++){
        username.push(name[i].innerHTML);
    }

    for(var i = 0; i<active.length; i++){
        activeTime.push(active[i].innerHTML);
    }

    var lineChart_ctx = document.getElementById("activeTimeRatio_chart").getContext("2d");
    var lineChart_plot = new Chart( lineChart_ctx, {
        type: "bar",
        data: {
            labels: username,
            datasets: [{
                label: "Active Time",
                backgroundColor: [
                    'rgba(255, 99, 132, 0.8)',
                    'rgba(54, 162, 235, 0.8)',
                    'rgba(255, 206, 86, 0.8)',
                    'rgba(75, 192, 192, 0.8)',
                    'rgba(153, 102, 255, 0.8)',
                    'rgba(255, 159, 64, 0.8)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1,
                data: activeTime,
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

</script>
</body>
</html>

