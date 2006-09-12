# QuicktimeHelper
module QuicktimeHelper

  def quicktime_tag(filename_with_path, id, width, height, options = {})
    
    quicktime_params = ""
    
    options.each_pair { |key, value| quicktime_params += "myQTObject.addParam(\"#{key}\", \"#{value}\");" }
	
  	"<script type=\"text/javascript\">
  	// <![CDATA[
  		var myQTObject = new QTObject(\"#{filename_with_path}\", \"#{id}\", \"#{width}\", \"#{options[:controller] == false ? height : height + 15 }\");
  		#{quicktime_params}
  		myQTObject.write();
  	// ]]>
  	</script>
  	<noscript>
  		<p>You must enable Javascript to view this content. <a href=\"#{filename_with_path}\">(Link to alternate content)</a></p>
  	</noscript>
  	"
  end

end