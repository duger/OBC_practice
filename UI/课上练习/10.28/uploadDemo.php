<?php
	//获取服务器文件共享根路径
	
	//获取服务器本地绝对路径
	$rootPath = $_SERVER["DOCUMENT_ROOT"];
	//获取服务器对于外地的地址，例如124.205.147.26
	$rootURL = $_SERVER["SERVER_NAME"];
	//设置上传资源存储的文件夹路径
	$resourcePath = "/student/class_10/resource";	
	
	//链接字符串，生成存储路径
	$realPath = $rootPath . $resourcePath;
	$realURL = "http://" . $rootURL . $resourcePath;
	
	//构造数据返回xml
	$xml = simplexml_load_string("<?xml version=\"1.0\" encoding=\"utf-8\" ?><root></root>");
	
	//生成一个根节点的子节点，用来存储参数列表
	$textChild = $xml->addChild("textitems");
	
	//foreach 语法，遍历字典数据结构中的关键字key，并且将key赋值给$postField，将key对应的值赋值给$valueData
	foreach ($_POST as $postField => $valueData)
	{
		$item = $textChild->addChild("item");
		//在根节点的子节点上，添加子节点
		$item->addChild("name",$postField);
		$item->addChild("value",$valueData);
	}
	
	//生成一个根节点的子节点，用来存储文件列表
	$fileChild = $xml->addChild("fileitems");
	
	//foreach 语法，遍历字典数据结构中的关键字key，并且将key赋值给$postField，将key对应的值赋值给$fileData
	foreach ($_FILES as $postField => $fileData) 
	{
		$item = $fileChild->addChild("item");
	  	$item->addChild("name",$fileData['name']);
	  	
		//$fileData对象仍然是一个字典结构，可以通过对应的error,tmp_name,name等关键字获取客户端上传的对应的参数
  		if ($fileData['error']) 
  		{
  			//如果文件上传失败的话，则将失败信息添加到失败结果
  			$item->addChild("error",$fileData['error']);
	  		continue;
	  	}
	  	//move_uploaded_file是一个函数，用来剪切文件从第一个参数，到第二个参数，所以两个参数都是服务器的绝对地址
	  	//$fileData字典结构，通过关键子tmp_name获取到的值，是对应的缓存文件，用户将文件上传后，服务器在没有处理时会有cache(缓存地址)来临时存储文件，name是客户端在使用multipart/form类型上传数据时，在Content-Disposition参数里的filename标签的值
	  	if (move_uploaded_file($fileData['tmp_name'],$realPath."/".$fileData['name'])) 
	  	{
	  		//如果服务器保存文件成功的话，则将url地址添加到xml结构中，用来做为服务器的返回值
	  		$item->addChild("url",$realURL."/".$fileData['name']);
		} 
		else 
		{
			//没有成功的话，则显示移动文件失败
			$item->addChild("error","move file error");
		}		
	}
	
	//服务器处理结束后，返回xml信息
	echo $xml->asXML();
?>
