Array.prototype.in_array = function(e){  
 for(i=0;i<this.length;i++){  
  if(this[i] == e){  
    return true;  
  }
 }  
  return false;  
}

var images = ["jpg","png","jpeg","bmp","gif","JPG","PNG","JPEG","BMP","GIF"];

var ROOT_FOLDER = "/userFiles";       //表示当前文件操作的根目录，但不对用户显示，到了发送request的时候才拼接。不包括最后的"/"
var MANAGER_SERVLET = "http://pic.wswhly.com:8080/fileManager/OnlineFileManagerServlet";    //指定管理功能的Servlet的路径
var UPLOAD_SERVLET = "http://pic.wswhly.com:8080/fileManager/UploadServlet";                //指定上传功能的Servlet的路径

dtreePath = '../dtree/';             //在dtree.js中加了这个变量，便于调整img路径
var tree;                           //tree必须为全局变量

//一直由$("#hiddenDirectory").attr("value")记录当前目录

//初始化工作
$(document).ready(function(){
    //设置ROOT_FOLDER
    ROOT_FOLDER = getUrlParam("rootFolder");
    if(ROOT_FOLDER == null)
    	ROOT_FOLDER = "/userFiles";
    //$("#fileInput").change(uploadFile);                     //上传控件选择的文件发生变化就上传，其实就是选择了文件后马上上传
    $("#uploadFileForm").attr("action", UPLOAD_SERVLET);    //设置处理上传请求的Servlet

    //绑定每个ajax动作开始到结束前都使用遮罩效果，缺点是当网速很快的时候就变了阻碍
    //        $(document).ajaxStart(function(){
    //            blockPage();
    //        }).ajaxStop(function(){
    //            unBlockPage();
    //        });

    $("#hiddenDirectory").attr("value", ROOT_FOLDER);     //必须重置,而且在列出目录之前
    refreshFiles(ROOT_FOLDER);
    refreshTree();
    
    //绑定按钮动作
    //    $("#refreshButton").click(function(){
    //        //            refreshFiles($("#hiddenDirectory").attr("value")); //在隐藏text中获取当前目录
    //    });
    $("#closeTipButton").click(function(){
        $("#operationTipDiv").hide();
    });
    //$("#uploadButton").click(uploadFile);
});

/**
 * 获取新的文件列表
 * dir表示该文件夹的根目录路径
 */
function refreshFiles(dir) {
    //第二个括号内“command”是参数名，可以带双引号，也可以直接写
    //url加了date是为了解决ie缓存的问题
    $.getJSON(MANAGER_SERVLET+"?t="+new Date(),{
        command:"listFile",
        directory :dir
    } , function(data){
        $('#title').nextAll().remove(); //delete all old data in the table
        if(data == null || data == ""){
            $("#fileListDiv").hide();       //隐藏表格，显示“文件夹为空”提示
            $("#noFileMessageDiv").show();
            return;
        }else{
            $("#fileListDiv").show();
            $("#noFileMessageDiv").hide();
        }
        //遍历JSON中的每个entry,建立表格.(用JSONArray返回的json数据用each,如果用JSONObject返回的数据只有一层,就不用each)
        $.each(data,function(entryIndex,entry){
            var html='<tr>';
            var downloadHref =' http://pic.wswhly.com:8080/fileManager' + dir + '/' + entry['fileName'];
            var filename = entry['fileName'];
            var strtype = filename.substring(filename.length-3,filename.length);
            if (images.in_array(strtype)) {
            	html+='<td><a href="'+ downloadHref +'" target="_blank"><img src="'+downloadHref+'" width="200"/></a></td>';
            } else {
            	html+='<td><a>'+filename+'</a></td>';
            }
            html+='<td>'+entry['fileSize']+'</td>';
            html+='<td>'+entry['uploadTime']+'</td>';
            html+='<td><img src="../image/rename.png" class="selestButton" file="'+entry['fileName']+
            '" directory="'+dir+'" title="选择"/></td>';
            html+='</tr>';
            $('#title').after(html);
        });
        bindClickAction();  //绑定删除按钮和重命名按钮动作
        changeTableStyle();         //加入相间颜色显示
    }
    );
}
var imagelistid="${imagelistid}";
/**
* 绑定删除按钮和重命名按钮动作
 */
function bindClickAction() {
    $(".selestButton").click(function(){
        var fileName = $(this).attr("file");
        var strtype = fileName.substring(fileName.length-3,fileName.length);
        if (!images.in_array(strtype)) {
        	jAlert('error', '请选择图片！');
        	return;
        }
        var dir = encodeURI($(this).attr("directory"));
        var parentWin=window.dialogArguments;
        var imageid="";
        try{
        	imageid=parentWin.imageid;
        }catch(e){
        }
        if(imageid!=""&&imageid!="undefined"&&imageid!=undefined){
        	parentWin.document.getElementById(imageid).innerHTML += "<img src='http://pic.wswhly.com:8080/fileManager"+dir + "/" + fileName+"?r=" + Math.random() + "' height='40px' onclick='deleteImg(this)' style='cursor:pointer;'/><br/>";
        }else{
        	parentWin.document.getElementById("imagelist").innerHTML += "<img src='http://pic.wswhly.com:8080/fileManager"+dir + "/" + fileName+"?r=" + Math.random() + "' height='40px' onclick='deleteImg(this)' style='cursor:pointer;'/><br/>";
        }
        
    });
}

/**
 * 加入相间颜色显示
 */
function changeTableStyle() {
    $("tr:even").addClass("evenTr");
    $("tr:odd").addClass("oddTr");
}

function refreshTree() {
    //生成新的树，ajax方式获取最新tree，每个json item表示一个节点
    //url加了date是为了解决ie缓存的问题
    $.getJSON(MANAGER_SERVLET+"?t="+new Date(), {
        command:"directoryTree",
        directory: ROOT_FOLDER
    }, function(data){
        tree = new dTree('tree');   //参数tree，表示生成的html代码中id的标记，不能修改，涉及到很多函数，如bindClickActionToTree
        tree.add(0, -1, '总目录', 'javascript:void(0)','');     //树根
        var selectedNodeNum = 0;    //设置要选中的节点
        //遍历JSON中的每个entry
        $.each(data,function(entryIndex,entry){
            //id和pid为了组建树，name是显示的文字，另外再绑定点击的动作，不用url
            //relativePath是相对路径，不包括ROOT_FOLDER，因为不显示ROOT_FOLDER给用户看
            tree.add(entry['id'], entry['pid'], entry['name'], "javascript:void(0)", entry['relativePath']);
            //如果等于当前目录，就要设置选中这个节点。因为前者包括ROOT_FOLDER，所以需要用indexOf，而不能直接比较
            if($("#hiddenDirectory").attr("value") == (ROOT_FOLDER + "/" + entry['relativePath'])){
                selectedNodeNum = entry['id'];  
            }
        }
        );
        $("#directoryTreeDiv").html(tree.toString());   //画出树
        tree.openAll(); //需要在树画出来后调用
        tree.s(selectedNodeNum);

        bindClickActionToTree();
    });
}

/**
 * 添加点击操作到树节点上，不用dtree默认的href，href设置为void(0)
 */
function bindClickActionToTree() {
    $(".node, .nodeSel").click(function(){
        //this是node
        var newDir = ROOT_FOLDER + "/" + this.title;
        $("#hiddenDirectory").attr("value", newDir);   //为上传做准备
        refreshFiles(newDir);
    })
}

/**
 * //获取request参数
 */
function getUrlParam(name){
    var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if (r!=null) return unescape(r[2]);
    return null;      
}
