# QuicktimeHelper
module QuicktimeHelper

  def quicktime_tag(filename_with_path, id, width, height, options = {})
    
    quicktime_params = ""
    
    if options.has_key? :placeholder
      initializer = %{var myQTObject = new QTObject("#{options[:placeholder]}", "#{id}", "#{width}", "#{options[:controller] == false ? height : height + 15 }");}
      options.delete_if {|key, value| key == :placeholder }
      options.merge(:href => filename_with_path, :target => "myself").each_pair { |key, value| quicktime_params += "myQTObject.addParam(\"#{key}\", \"#{value}\");" }
    else
      initializer = %{var myQTObject = new QTObject("#{filename_with_path}", "#{id}", "#{width}", "#{options[:controller] == false ? height : height + 15 }");}
      options.each_pair { |key, value| quicktime_params += "myQTObject.addParam(\"#{key}\", \"#{value}\");" }
    end
	  	
  	%{
  	  <script type="text/javascript">
  	    // <![CDATA[
          #{initializer}
  		    #{quicktime_params}
  		    myQTObject.write();
  	    // ]]>
  	  </script>
  	  <noscript>
  		  <p>You must enable Javascript to view this content. <a href="#{filename_with_path}">(Link to alternate content)</a></p>
  	  </noscript>
    } 
  end

end