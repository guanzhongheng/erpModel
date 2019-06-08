var allItem = [
    ["销售管理","合同管理"],
    ["库存管理","原材料库存管理","产品库存管理","出库单"],
    ["产品及原料管理","产品数据字典","半成品数据字典","原材料数据字典"],
    ["任务调度","任务分配"]
];

function isContains(str, substr) {
    return new RegExp(substr).test(str);
}

//HomeFuncSearch
function doSearch(value){
    var subItem;
    var ifElseContain = false;
    for (var i = 0; i < allItem.length; i++) {
        for (var j = 0; j < allItem[i].length; j++) {
            subItem = allItem[i][j];
            if(isContains(subItem,value) && value!=""){
                ifElseContain=true;
                debugger;
                if(j==0){
                    switch(i){
                        case 0 :
                            $('#HomeFuncAccordion').accordion('select',allItem[0][0]);
                            var node = $('#scheduleMonitor').tree('find',11);
                            $('#scheduleMonitor').tree('expandTo', node.target).tree('select', node.target);
                            break;
                        case 1 :
                            $('#HomeFuncAccordion').accordion('select',allItem[1][0]);
                            var node = $('#deviceMonitor').tree('find',21);
                            $('#deviceMonitor').tree('expandTo', node.target).tree('select', node.target);
                            break;
                        case 2 :
                            $('#HomeFuncAccordion').accordion('select',allItem[2][0]);
                            var node = $('#technologyMonitor').tree('find',31);
                            $('#technologyMonitor').tree('expandTo', node.target).tree('select', node.target);
                            break;
                        case 3 :
                            $('#HomeFuncAccordion').accordion('select',allItem[3][0]);
                            var node = $('#materialMonitor').tree('find',41);
                            $('#materialMonitor').tree('expandTo', node.target).tree('select', node.target);
                            break;
                        default:
                            break;
                    }
                }else if(j>0){
                    debugger;
                    var k = (i+1)*10+j;
                    switch(i){
                        case 0 :
                            $('#HomeFuncAccordion').accordion('select',allItem[0][0]);
                            var node = $('#scheduleMonitor').tree('find',k);
                            $('#scheduleMonitor').tree('expandTo', node.target).tree('select', node.target);
                            break;
                        case 1 :
                            $('#HomeFuncAccordion').accordion('select',allItem[1][0]);
                            var node = $('#deviceMonitor').tree('find',k);
                            $('#deviceMonitor').tree('expandTo', node.target).tree('select', node.target);
                            break;
                        case 2 :
                            $('#HomeFuncAccordion').accordion('select',allItem[2][0]);
                            var node = $('#technologyMonitor').tree('find',k);
                            $('#technologyMonitor').tree('expandTo', node.target).tree('select', node.target);
                            break;
                        case 3 :
                            $('#HomeFuncAccordion').accordion('select',allItem[3][0]);
                            var node = $('#materialMonitor').tree('find',k);
                            $('#materialMonitor').tree('expandTo', node.target).tree('select', node.target);
                            break;
                        default:
                            break;
                    }

                }
                break;
            }
        }
        if(ifElseContain==true){
            break;
        }
    }
}

$(function() {
    /* Schedule Manager Tree onClick Event */
    $('#saleMonitor').tree({
        onClick : function(node) {
            if ($('#scheduleMonitor').tree("isLeaf", node.target)) {
                var tabs1 = $("#tabs");
                var tab1 = tabs1.tabs("getTab", node.text);
                if (tab1) {
                    tabs1.tabs("select", node.text);
                } else {
                    tabs1.tabs('add', {
                        title : node.text,
                        href : node.attributes.url,
                        closable : true,
                        bodyCls : "content"
                    });
                }
            }
        }
    });

    /* Device Manager Tree onClick Event */
    $('#stockMonitor').tree({
        onClick : function(node) {
            /* debugger; */
            debugger;
            if ($('#deviceMonitor').tree("isLeaf", node.target)) {
                var tabs2 = $("#tabs");
                var tab2 = tabs2.tabs("getTab", node.text);
                if (tab2) {
                    tabs2.tabs("select", node.text);
                } else {
                    tabs2.tabs('add', {
                        title : node.text,
                        href : node.attributes.url,
                        closable : true,
                        bodyCls : "content"
                    });
                }
            }
        }
    });

    /* Material Manager Tree onClick Event */
    $('#prodMonitor').tree({
        onClick : function(node) {
            if ($('#materialMonitor').tree("isLeaf", node.target)) {
                var tabs2 = $("#tabs");
                var tab2 = tabs2.tabs("getTab", node.text);
                if (tab2) {
                    tabs2.tabs("select", node.text);
                } else {
                    tabs2.tabs('add', {
                        title : node.text,
                        href : node.attributes.url,
                        closable : true,
                        bodyCls : "content"
                    });
                }
            }
        }
    });

    /* qualify Manager Tree onClick Event */
    $('#workMonitor').tree({
        onClick : function(node) {
            if ($('#qualifyMonitor').tree("isLeaf", node.target)) {
                var tabs1 = $("#tabs");
                var tab1 = tabs1.tabs("getTab", node.text);
                if (tab1) {
                    tabs1.tabs("select", node.text);
                } else {
                    tabs1.tabs('add', {
                        title : node.text,
                        href : node.attributes.url,
                        closable : true,
                        bodyCls : "content"
                    });
                }
            }
        }
    });

    /* Sys Manager Tree onClick Event */
    $('#sysManager').tree({
        onClick : function(node) {
            if ($('#sysManager').tree("isLeaf", node.target)) {
                var tabs3 = $("#tabs");
                var tab3 = tabs3.tabs("getTab", node.text);
                if (tab3) {
                    tabs3.tabs("select", node.text);
                } else {
                    tabs3.tabs('add', {
                        title : node.text,
                        href : node.attributes.url,
                        closable : true,
                        bodyCls : "content"
                    });
                }
            }
        }
    });

});