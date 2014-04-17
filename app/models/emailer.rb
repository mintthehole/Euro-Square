class Emailer < ActiveRecord::Base
  attr_accessible :bcc, :body, :cc, :footer, :header, :name, :stage, :subject,:email_tables_attributes,:emailer_horizontals_attributes,:trigger_filed, :emailer_middles_attributes
  has_many :email_tables
  has_many :emailer_horizontals
  has_many :emailer_middles
  validate :emailer_template
  validates_uniqueness_of :stage
  attr_accessor :email_tables_attributes, :emailer_horizontals_attributes,:emailer_middles_attributes
  accepts_nested_attributes_for :email_tables, :emailer_horizontals,:emailer_middles, :allow_destroy => true


  def send_email(booking,user)
  	be = BookingEmailer.create(:booking_id => booking.id, :user_id => user.id,:emailer_id => self.id, :state => BookingEmailer::SEND_FOR_CONF )
  	EuroEximMailer.delay.send_emailer(be)
  end


  def emailer_template
    if self.subject.include? "%{"
      start = self.subject.index('{').to_i ==  0 ? 0 : self.subject.index('{') + 1
      a_end = self.subject.index('}').to_i ==  0 ? self.subject.count : self.subject.index('}') - 1
      val = self.subject[start..a_end] rescue self.subject
      if BookingOrder.first.magic_columns.where(:name => val).empty?
        errors.add(:subject," : No Field named #{val} in booking order. Plz Correct ")
      end
    end
  end

  def email_template_tables(hash)
    string = ''
    no = 2
     if email_tables.any?
       email_tables.order('order_no asc').each do |et|
         value = (et.right % hash).html_safe || '' rescue ''
         if !value.blank?
          no +=1
          string = string +  "<tr style='min-height:20.1pt'>  <td width='216'  style='width:233.0pt;border-top:none;border-left:none;border-bottom:solid #95b3d7 1.0pt;border-right:solid #95b3d7 1.0pt;background:#215868;color:white;padding:0cm 5.4pt 0cm 5.4pt;height:25px;'>    #{et.left % hash rescue et.left}  </td>  <td width='314'  style='width:235.5pt;border-top:none;border-left:none;border-bottom:solid white 1.0pt;border-right:solid white 1.0pt;background:#eeece1;padding:0cm 5.4pt 0cm 5.4pt;height:25px;'>    #{value}  </td></tr>"
         end
       end
     end
    [string,no]
  end

end
