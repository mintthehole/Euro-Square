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
			return '<div class="first">
  <p>Dear #{filed_name},</p>
  <div class="frst">Good day form EURO EXIM. Thanks a lot for your support.We have given below our<b> SUBJECT</b>  for your shipment, Details as follows:</div>
</div>
<div class="secd">Current Mile Stone</div>
'
		else
			return val
		end
	end
end
