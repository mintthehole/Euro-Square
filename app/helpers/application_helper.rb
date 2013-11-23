module ApplicationHelper
	def active_class(path)
	  request.path.match(path) ? 'active' : 'remove_active'
	end

	def get_footer_text(val)
		if val.blank?
			a = ''
		else
			return val
		end
	end

	def footer(name,desgn)
		"<p style='margin:0in;margin-bottom:.0001pt'><i>Warm Regards,</i><br><span style='font-size:18.0pt;font-family:&quot;Monotype Corsiva&quot;;color:teal'>#{name},</span><span style='font-size:18.0pt;color:blue'><br></span>#{desgn},<span style='font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:gray'><u></u><u></u></span></p><p style='margin:0in;margin-bottom:.0001pt'><span style='font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;'><u></u>&nbsp;<u></u></span></p><p style='margin:0in;margin-bottom:.0001pt'><img border='0' width='250' height='51' alt='Description: cid:image001.png@01CE565D.012FCC20' src='?ui=2&amp;ik=324054dd6d&amp;view=att&amp;th=1405826129fcd4a1&amp;attid=0.0.1&amp;disp=emb&amp;zw&amp;atsh=1'><span style='font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:navy'><br></span><i><span style='font-size:10.0pt;font-family:&quot;Verdana&quot;,&quot;sans-serif&quot;'>______________________________<wbr></wbr>____________<span style='color:#1f497d'><u></u><u></u></span></span></i></p><p style='margin:0in;margin-bottom:.0001pt'>Tel&nbsp;&nbsp;&nbsp;&nbsp;:0091 421-4526334/2471882/2486833<br>Fax&nbsp;&nbsp;&nbsp;&nbsp; :0091 421-2471882&nbsp;<span style='font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:gray'><u></u><u></u></span></p><p style='margin:0in;margin-bottom:.0001pt'>HP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:0091 999444 9506<span style='font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:gray'><u></u><u></u></span></p><p style='margin:0in;margin-bottom:.0001pt'>Email&nbsp; :&nbsp;<a target='_blank' href='mailto:crm@euroeximindia.com'><span style='color:gray;text-decoration:none'><span class='il'>crm@euroeximindia.com</span></span></a><br>E-Visit: <a target='_blank' href='http://www.euroeximindia.com/'><span style='color:gray;text-decoration:none'>www.euroeximindia.com</span></a><span style='font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:gray'><u></u><u></u></span></p><p style='margin:0in;margin-bottom:.0001pt'><span lang='EN-IN'>E<span style='color:gray'>=</span><span style='color:navy'>MC</span><sup>2</sup></span><span lang='EN-IN' style='font-size:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;'><u></u><u></u></span></p><p style='margin:0in;margin-bottom:.0001pt'><span lang='EN-IN'>EUROEXIM = Managing Cargo with Care... </span><span lang='EN-IN' style='font-size:10.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:gray'><u></u><u></u></span></p><p style='margin:0in;margin-bottom:.0001pt'><span lang='EN-IN'>------------------------------<wbr></wbr>------------------------------<wbr></wbr>--------------------</span><span lang='EN-IN' style='font-size:10.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:gray'><u></u><u></u></span></p><p style='margin:0in;margin-bottom:.0001pt'><b><span lang='EN-IN' style='background:silver'>EURO EXIM </span></b><span lang='EN-IN' style='background:silver'>has received the <b>Award of Excellence-2012</b> at Global Annual Conference,Singapore presented by<b> </b>WWPC California, USA</span><b><span lang='EN-IN'>.</span></b><b><span style='font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;'><u></u><u></u></span></b></p>".html_safe
	end
	def get_header(val)
		if val.blank?
			return '<p><span style="font-family:calibri,sans-serif; font-size:11.0pt">Dear %{customer_name} , </span></p>				<p><span style="font-family:calibri,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Good day form EURO EXIM. &nbsp; &nbsp; Thanks a lot for your support. We have given below our <strong><span style="color:#215868; font-family:calibri,sans-serif">&ldquo;&nbsp;SUBJECT&rdquo;</span></strong> for your shipment, Details as follows:</span></p>				<p>&nbsp;</p><p><strong><u><span style="font-family:calibri,sans-serif; font-size:11.0pt">Current Mile Stone Update:</span></u></strong></p>'
		else
			return val
		end
	end

	def get_footer(val)
		if val.blank?
			return "<p>Looking forward to a long and strong relationship with you in the business</p><p>Whileour being true to our motto in <strong>Managing your cargo with care!</strong></p><p>&nbsp;</p><p><em>WarmRegards,</em><br /><span style='color:teal; font-family:monotype corsiva; font-size:18.0pt'>%{user_name}</span><br />Executive Customer Service</p><p><img alt='Footer Image' src='https://www.filepicker.io/api/file/nm2SN2RpSvmwS351HSyO' style='height:51px; width:250px' /><br /><em><span style='font-family:verdana,sans-serif; font-size:10.0pt'>__________________________________________</span></em></p><p>Tel&nbsp;&nbsp;&nbsp;&nbsp;:0091 421-2471882/2486833<br />Fax&nbsp;&nbsp;&nbsp;&nbsp; :0091 421-2471882&nbsp;<br />HP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :0091 99944 49506<br />Email&nbsp; :&nbsp;<a href='mailto:import@euroeximindia.com' target='_blank'>import@euroeximindia.com</a><br />E-Visit: <span style='color:#002060'><a href='http://www.euroeximindia.com/' target='_blank'><span style='color:black'>www.euroeximindia.com</span></a></span></p><p>E<span style='color:gray'>=</span><span style='color:navy'>MC</span><sup>2</sup></p><p>EURO EXIM = ManagingCargo with Care...</p><p>--------------------------------------------------------------------------------</p><p><strong>EURO EXIM </strong>has received the <strong>Award of Excellence-2012</strong> at Global Annual Conference, Singapore presented by<strong> </strong>WWPCCalifornia, USA<strong>.</strong></p>"		
		else
			return val
		end
	end
end
