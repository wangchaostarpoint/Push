//20201118新增demo数据

var project_dept_chart = document.getElementById('project_dept_chart');
//项目部门分布统计
if (project_dept_chart != undefined) {
    var project_dept_option = {
        title: {
            text: '',
            subtext: ''
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            }
        },
        legend: {
            data: ['', '']
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            top: '3%',
            containLabel: true
        },
        yAxis: {
            type: 'value',
            boundaryGap: [0, 0.1]
        },
        xAxis: {
            type: 'category',
            data: ['规划设计研究所', '水工设计研究所', '施工设计研究所', '机电设计研究所', '建筑设计分院', '水保环评设计研究所'],
            axisLabel: {
                rotate: 30
            }
        },
        series: [
            {
                name: '项目数量',
                type: 'bar',
                data: [755, 269, 275, 268, 285, 395],
                label: {
                    show: true,
                    position: 'top'
                },
                itemStyle: {
                    color: '#4c97ce'
                }
            }
        ]
    };
    echarts.init(project_dept_chart).setOption(project_dept_option);
}

var project_type_chart = document.getElementById('project_type_chart');
//项目类型分布统计
if (project_type_chart != undefined) {
    echarts.init(project_type_chart).setOption({
        title: {
            text: '',
            subtext: ''
        },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        series: {
            name: '项目数量',
            type: 'pie',
            radius: '80%',
            center: ['50%', '50%'],
            label: {
                normal: {
                    show: true,
                    formatter: "{b} : {c} ({d}%)"
                },
                emphasis: {
                    show: true,
                    textStyle: {
                        fontSize: '12',
                        fontWeight: 'bold'
                    }
                }
            },
            labelLine: {
                normal: {
                    show: true
                }
            },
            data: [{
                name: '水利',
                value: 982,
                //itemStyle: {
                //	color: '#abd4f6'
                //}
            },
            {
                name: '水电',
                value: 131,
                //itemStyle: {
                //	color: '#6ca0cb'
                //}
            },
            {
                name: '规划',
                value: 136,
                //itemStyle: {
                //	color: '#598fbd'
                //}
            },
            {
                name: '勘测',
                value: 210,
                //itemStyle: {
                //	color: '#acaed8'
                //}
            },
            {
                name: '工民建',
                value: 179,
                //itemStyle: {
                //	color: '#acaed8'
                //}
            },
            {
                name: '其他',
                value: 108,
                //itemStyle: {
                //	color: '#acaed8'
                //}
            },
            ],
            itemStyle: {
                emphasis: {
                    shadowBlur: 10,
                    shadowOffsetX: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            }
        }
    });
}

var task_year_chart = document.getElementById('task_year_chart');
// 任务下达年度对比分析
if (task_year_chart != undefined) {
    var task_year_option = {
        title: {
            //      text: '公司近一年到款分析',
            subtext: ''
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data: ['2019年', '2020年']
        },
        toolbox: {
            feature: {
                dataZoom: {
                    yAxisIndex: 'none'
                },
                restore: {},
                saveAsImage: {}
            }
        },
        calculable: true,
        xAxis: [{
            type: 'category',
            data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月']
        }],
        yAxis: [{
            type: 'value'
        }],
        series: [{
            name: '2019年',
            type: 'line',
            data: [30, 35, 31, 24, 39, 35, 27, 31, 35, 29, 27, 31],
            markLine: {
                data: [{
                    type: 'average',
                    name: '平均值'
                }]
            },
            itemStyle: {
                color: '#4c97ce'
            }

        },
        {
            name: '2020年',
            type: 'line',
            data: [22, 28, 19, 21, 37, 43, 33, 39, 36, 38],
            markLine: {
                data: [{
                    type: 'average',
                    name: '平均值'
                }]
            },
            itemStyle: {
                color: '#a0c7e6'
            }
        }
        ]
    };
    echarts.init(task_year_chart).setOption(task_year_option);
}

var project_state_chart = document.getElementById('project_state_chart');
//项目状态分布统计
if (project_state_chart != undefined) {
    var project_state_option = {
        title: {
            text: '',
            subtext: ''
        },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        series: {
            name: '项目数量',
            type: 'pie',
            radius: '80%',
            center: ['50%', '50%'],
            label: {
                normal: {
                    show: true,
                    formatter: "{b} : {c} ({d}%)"
                },
                emphasis: {
                    show: true,
                    textStyle: {
                        fontSize: '12',
                        fontWeight: 'bold'
                    }
                }
            },
            labelLine: {
                normal: {
                    show: true
                }
            },
            data: [{
                name: '已下达',
                value: 103,
                //itemStyle: {
                //	color: '#abd4f6'
                //}
            },
            {
                name: '进行中',
                value: 556,
                //itemStyle: {
                //	color: '#6ca0cb'
                //}
            },
            {
                name: '暂停',
                value: 36,
                //itemStyle: {
                //	color: '#598fbd'
                //}
            },
            {
                name: '已完成',
                value: 1088,
                //itemStyle: {
                //	color: '#acaed8'
                //}
            },
            ],
            itemStyle: {
                emphasis: {
                    shadowBlur: 10,
                    shadowOffsetX: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            }
        }
    };
    echarts.init(project_state_chart).setOption(project_state_option);
}

var designchange_level_chart = document.getElementById('designchange_level_chart');
//设计变更按级别统计
if (designchange_level_chart != undefined) {
    echarts.init(designchange_level_chart).setOption({
        title: {
            text: '',
            subtext: ''
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            }
        },
        legend: {
            data: ['']
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            top: '10%',
            containLabel: true
        },
        yAxis: [{
            type: 'value',
            boundaryGap: [0, 0.1]
        }
        ],
        xAxis: {
            type: 'category',
            data: ['一般I类', '一般II类', '重大'],
            axisLabel: {
                rotate: 0
            },
        },
        series: [
            {
                name: '',
                type: 'bar',
                barWidth: 35,
                data: [56, 138, 22],
                label: {
                    show: true,
                    position: 'top'
                },
            },
        ]
    });
}

var designchange_reason_chart = document.getElementById('designchange_reason_chart');
//设计变更按原因统计
if (designchange_reason_chart != undefined) {
    echarts.init(designchange_reason_chart).setOption({
        title: {
            text: '',
            subtext: ''
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            }
        },
        legend: {
            data: ['']
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            top: '10%',
            containLabel: true
        },
        yAxis: [{
            type: 'value',
            boundaryGap: [0, 0.1]
        }
        ],
        xAxis: {
            type: 'category',
            data: ['原设计中错漏碰等问题', '现场地质条件与原设计条件有出入', '相关方（顾客、施工方等）提出更改', '法规、技术标准规范更新', '设计优化'],
            axisLabel: {//坐标轴刻度标签的相关设置。
                formatter: function (params) {
                    var newParamsName = "";// 最终拼接成的字符串
                    var paramsNameNumber = params.length;// 实际标签的个数
                    var provideNumber = 5;// 每行能显示的字的个数
                    var rowNumber = Math.ceil(paramsNameNumber / provideNumber);// 换行的话，需要显示几行，向上取整

                    /**
                     * 判断标签的个数是否大于规定的个数， 如果大于，则进行换行处理 如果不大于，即等于或小于，就返回原标签
                     */

                    // 条件等同于rowNumber>1
                    if (paramsNameNumber > provideNumber) {

                        /** 循环每一行,p表示行 */
                        for (var p = 0; p < rowNumber; p++) {
                            var tempStr = "";// 表示每一次截取的字符串
                            var start = p * provideNumber;// 开始截取的位置
                            var end = start + provideNumber;// 结束截取的位置
                            // 此处特殊处理最后一行的索引值
                            if (p == rowNumber - 1) {

                                // 最后一次不换行
                                tempStr = params.substring(start, paramsNameNumber);

                            } else {

                                // 每一次拼接字符串并换行
                                tempStr = params.substring(start, end) + "\n";
                            }

                            newParamsName += tempStr;// 最终拼成的字符串
                        }
                    }
                    else {
                        // 将旧标签的值赋给新标签
                        newParamsName = params;
                    }

                    //将最终的字符串返回
                    return newParamsName;
                }
            }
        },
        series: [
            {
                name: '',
                type: 'bar',
                barWidth: 35,
                data: [36, 83, 65, 32, 16],
                label: {
                    show: true,
                    position: 'top'
                },
            },
        ]
    });
}


var myChart = echarts.init(document.getElementById('page_views_today_bar'));

// 指定图表的配置项和数据
$.ajax({
    method: 'POST',
    data: {
        asyfunc: "GetChargeData"
    },
    url: '/Portal/MM/BH/BHIndex.aspx',
    success: function (result) {
        if (result) {
            var jsonObj = $.parseJSON(result)
            myChart.setOption({
                title: {
                    //      text: '公司近一年到款分析',
                    subtext: '单位（万元）'
                },
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    data: ['计划到款', '实际到款']
                },
                calculable: true,
                xAxis: [{
                    type: 'category',
                    data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月']
                }],
                yAxis: [{
                    type: 'value'
                }],
                series: [{
                    name: '计划到款',
                    type: 'bar',
                    data: jsonObj[0].planValue,
                    markLine: {
                        data: [{
                            type: 'average',
                            name: '平均值'
                        }]
                    },
                    itemStyle: {
                        color: '#4c97ce'
                    }

                },
                {
                    name: '实际到款',
                    type: 'bar',
                    data: jsonObj[0].factValue,
                    markLine: {
                        data: [{
                            type: 'average',
                            name: '平均值'
                        }]
                    },
                    itemStyle: {
                        color: '#a0c7e6'
                    }

                }
                ]
            });
        }
    },
    error: function (ex) { }
})

myChart.on('click', function (param) {
    var name = param.seriesName;
    var month = param.dataIndex;
    if (name == "实际到款") {
        var nowDate = new Date();
        startDate = new Date(nowDate.getFullYear(), month, 1);
        endDate = new Date(nowDate.getFullYear(), month + 1, 0);
        $startDate = timeStamp2String(startDate);
        $endDate = endDate.getFullYear() + "-" + (endDate.getMonth() + 1) + "-" + endDate.getDate() + " 23:23:59";
        var url = $appCtx.appPath + "/MM/List/MCM/ContractChargeDetail.aspx";
        url += "?chargeStartDate=" + $startDate + "&chargeEndDate=" + $endDate;
        window.open(url, "_blank");
    }
});

//echarts.init(document.getElementById('bottom-echart')).setOption({
//    title: {
//        text: '2018年合同额总计',
//        subtext: '单位：万元',

//    },
//    tooltip: {
//        trigger: 'item',
//        formatter: "{a} <br/>{b} : {c} ({d}%)"
//    },
//    series: {
//        name: '合同额',
//        type: 'pie',
//        radius: '55%',
//        center: ['50%', '60%'],
//        label: {
//            normal: {
//                show: true,
//                formatter: "{b} : {c}"
//            },
//            emphasis: {
//                show: true,
//                textStyle: {
//                    fontSize: '12',
//                    fontWeight: 'bold'
//                }
//            }
//        },
//        labelLine: {
//            normal: {
//                show: true
//            }
//        },
//        data: [{
//            name: '勘测',
//            value: 8652.12,
//            itemStyle: {
//                color: '#abd4f6'
//            }
//        },
//        {
//            name: '科研',
//            value: 9020.08,
//            itemStyle: {
//                color: '#6ca0cb'
//            }
//        },
//        {
//            name: '其它',
//            value: 6458.7,
//            itemStyle: {
//                color: '#598fbd'
//            }
//        },
//        {
//            name: '总承包',
//            value: 189239.23,
//            itemStyle: {
//                color: '#7caed8'
//            }
//        },
//        {
//            name: '咨询',
//            value: 12431.67,
//            itemStyle: {
//                color: '#9cc7eb'
//            }
//        },
//        {
//            name: '设计',
//            value: 242617.16,
//            itemStyle: {
//                color: '#457ead'
//            }
//        },
//        {
//            name: '监理',
//            value: 9343.56,
//            itemStyle: {
//                color: '#8dbbe2'
//            }
//        }

//        ],
//        itemStyle: {
//            emphasis: {
//                shadowBlur: 10,
//                shadowOffsetX: 0,
//                shadowColor: 'rgba(0, 0, 0, 0.5)'
//            }
//        }
//    }
//});

var contractPieChart = echarts.init(document.getElementById('bottom-echart'));

// 指定图表的配置项和数据
$.ajax({
    method: 'POST',
    data: {
        asyfunc: "GetContractPie"
    },
    url: '/Portal/MM/BH/BHIndex.aspx',
    success: function (result) {
        if (result) {
            var jsonObj = $.parseJSON(result)
            contractPieChart.setOption({
                title: {
                    //text: '2018年合同额总计',
                    subtext: '单位：万元',

                },
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                color: ['#abd4f6', '#6ca0cb', '#598fbd', '#8dbbe2', '#457ead', '#9cc7eb', '#7caed8'],
                series: {
                    name: '合同额',
                    type: 'pie',
                    radius: '55%',
                    center: ['50%', '60%'],
                    label: {
                        normal: {
                            show: true,
                            formatter: "{b} : {c}"
                        },
                        emphasis: {
                            show: true,
                            textStyle: {
                                fontSize: '12',
                                fontWeight: 'bold'
                            }
                        }
                    },
                    labelLine: {
                        normal: {
                            show: true
                        }
                    },
                    data: jsonObj,
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            });
        }
    },
    error: function (ex) { }
})

contractPieChart.on('click', function (param) {
    var name = param.name;
    var nowDate = new Date();
    $startDate = nowDate.getFullYear() + "-01-01 00:00:00";;
    $endDate = nowDate.getFullYear() + "-12-31 23:23:59";
    var url = $appCtx.appPath + "/MM/List/MCM/ContractListNew.aspx";
    url += "?paramBusinessPlate=" + name + "&signStartDate=" + $startDate + "&signEndDate=" + $endDate;
    window.open(url, "_blank");
});

var contractPieChartCG = echarts.init(document.getElementById('bottom-echart-cg'));

// 指定图表的配置项和数据
$.ajax({
    method: 'POST',
    data: {
        asyfunc: "GetPurchaseContractPie"
    },
    url: '/Portal/MM/BH/BHIndex.aspx',
    success: function (result) {
        if (result) {
            var jsonObj = $.parseJSON(result)
            contractPieChartCG.setOption({
                title: {
                    //text: '2018年合同额总计',
                    subtext: '单位：万元',

                },
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                color: ['#abd4f6', '#6ca0cb', '#598fbd', '#8dbbe2', '#457ead', '#9cc7eb', '#7caed8'],
                series: {
                    name: '合同额',
                    type: 'pie',
                    radius: '55%',
                    center: ['50%', '60%'],
                    label: {
                        normal: {
                            show: true,
                            formatter: "{b} : {c}"
                        },
                        emphasis: {
                            show: true,
                            textStyle: {
                                fontSize: '12',
                                fontWeight: 'bold'
                            }
                        }
                    },
                    labelLine: {
                        normal: {
                            show: true
                        }
                    },
                    data: jsonObj,
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            });
        }
    },
    error: function (ex) { }
})

contractPieChartCG.on('click', function (param) {
    var name = param.name;
    var nowDate = new Date();
    $startDate = nowDate.getFullYear() + "-01-01 00:00:00";;
    $endDate = nowDate.getFullYear() + "-12-31 23:23:59";
    var url = $appCtx.appPath + "/MM/List/MBM/PurchasingContractList.aspx";
    url += "?contractType=" + name + "&signStartDate=" + $startDate + "&signEndDate=" + $endDate;
    window.open(url, "_blank");
});
