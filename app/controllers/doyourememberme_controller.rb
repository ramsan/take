class DoyouremembermeController < ApplicationController


require 'json'

class Categorie < ActiveRecord::Base
end

class Categories_memorie < ActiveRecord::Base
end

class Comment < ActiveRecord::Base
end

class Following < ActiveRecord::Base
end

class Image < ActiveRecord::Base
end

class Invitation < ActiveRecord::Base
end

class Memorie < ActiveRecord::Base
end

class Memories_user < ActiveRecord::Base
end

class Scheme_migration < ActiveRecord::Base
end

class Service < ActiveRecord::Base
end

class Session < ActiveRecord::Base
end

class Showdown < ActiveRecord::Base
end

class User < ActiveRecord::Base 
end

class Visit < ActiveRecord::Base
end

class Vote < ActiveRecord::Base
end

class You_tube_video < ActiveRecord::Base
end


/........................................................................................................................................................../
  def home
 
  
  end # end for home
  
 
/............................................................................................................................................................/

def count(counting)
i=0;
if !counting.nil?
counting.each do |e|
i=i+1
end
end
return i


end # end for count function 


/............................................................................................................................................................./
# this service for sending email to the user only...

def b(e)
var =e#'rameshram535@gmail.com'# enter admin email id
Mail.defaults do
  delivery_method :smtp, { :address   => "smtp.sendgrid.net",
                           :port      => 587,
                           :domain    => "yourdomain.com",
                           :user_name => "mybusinessapp",
                           :password  => "4emc912",
                           :authentication => 'plain',
                           :enable_starttls_auto => true }
end
to = var
mail = Mail.deliver do |f|
 f.to = var
 f.from 'Doyourememberme<noreplay@doyouremberme.com>'
  f.subject = "This is from Doyourememberme App..."
  f.text_part do
    body 'HAi.....'
  end
 f.html_part do
    content_type 'text/html; charset=UTF-8'
    body '<b>DoYouRememberme....</b>'
  end
end
#return var
end

# end for the send email......








/................................................................................................................................................................................./


# this method is for addcoments 
def addcoments



time = Time.new()
	userid = params[:userid]
	memoryid = params[:memoryid]
	comment = params[:comment]
	@msg = Array.new
	
	
	if ( !userid.nil? && !memoryid.nil? )
		var = "not null"
		com=Comment.new
		com.content = comment
		com.user_id = userid
		com.memory_id = memoryid
		com.updated_at = time
			if com.save
				@msg[0]={"message"=>"inserted success fully"}
				
			else
				@msg[0]={"message"=>"inserted failed"}
				
			end
		else
		@msg[0]={"message"=>"please provide the values"}
		
		end
		
	
render :json => @msg

end
# end of the addcomment file

/.........................................................................................................................../









#starting for add favourite............
def addfavourite

# requirements..
memoryid =1# params[:memoryid]
userid = 1#params[:userid]
@msg = Array.new


	if ( !memoryid.nil? && !userid.nil? )
        memuser = Memories_user.find(:all, :conditions =>["memory_id = ? AND user_id = ? ",memoryid, userid] )
        countmemuser = count(memuser)		
		 
			if(countmemuser > 0)
			 
			    # deletion command...................
			
			
				 Memories_user.delete_all(:memory_id => memoryid, :user_id => userid)
				 
				userids = Memories_user.find(:all, :conditions =>[" memory_id = ?",memoryid] )
				countuserids = count(userids)
				h={"result"=>"user unfavourite successfully","favcount"=>countuserids}
				@msg[0]=h
			else
				memusr2 = Memories_user.new
				memusr2.memory_id = memoryid
				memusr2.user_id = userid
				memusr2.save
				
				memuser2 = Memories_user.find(:all, :conditions =>["memory_id = ?",memoryid])
				countmemuser = count(memuser2)		
				@msg[0]={"result"=>"Successfully inserted","favcount"=>countmemuser }		
					
			end		
		
		
		else

	@msg[0]={"message"=>"Please provide all Values"}	
	
	
		end
		@msg=@msg.to_json
render :json => @msg

	end # end for addfavourite
# add favourites compleeted

/............................................................................................................................................................/



#Starting for the addmemoriesdetails
def addmemoriedetails
name = 'a'#params[:name]
desc = 'a'#params[:desc]
userid = 'a'#params[:userid]
decade = 'a'#params[:decade]
catid ='aa'#params[:catid]
img = 'a'#params[:image]   
@msg = Array.new

type = File.extname(img.to_s)   

size = img.size( )
#    size = number_to_human_size(File.size(img))
#params[:img]
# get only the filename, not the whole path (from IE)
img1 = File.basename(img,'.jpg') 
 # replace all none alphanumeric, underscore or perioids
  # with underscore
  img1=img1.rstrip
img1 = img1.gsub( /[^\w\.\-]/ , '_')  
  t=Time.new      # here t is for image name purpus
  t1=Time.new      # here t1 is for inserting (time function ) purpus
  t = t.inspect
 t=t.sub(' ','')
  t=t.sub(' ','')
  img1=img1+t+".jpg"
  path = "images/"+img1
 
 if ( name.length!=0 && catid.length!=0)
 
	mem = Memorie.new
	mem.name = name
	mem.description =desc 
	mem.user_id = userid
	mem.decade = decade
	mem.created_at = t1
	mem.updated_at = t1
	mem.save
 
	catmemory = Categories_memorie.new
	catmemory.category_id = catid
	catmemory.memory_id = mem.id
	if catmemory.save
 # here we have to write the code block for the  uploadin photo...
 
 
 
 # end for the uploading file....
 
		images = Image.new
		images.image_file_name = img1
		images.image_content_type = type
		images.image_file_size = size
		images.image_updated_at = t1
		images.memory_id = mem.id
		images.user_id = userid
		images.created_at = t1
		images.save
		@msg[0]={"message"=>"Successfully memories added"}
		
	else
		@msg[0]={"message"=>"fail to add"}
		
 
	end
 
 
else
 @msg[0]={"message"=>"provide Values"}

 end
 
render :json => @msg


end #end for addmem def
# end to the adddmemorydetails 

/.................................................................................................................................................................................../
 
 
 
 
   
  #starting for B
  
  
  def B
	
	memuserid =1# params[:memuserid]
	userid = 1#params[:userid]
	i=0
	@msg = Array.new
	
	if( !memuserid.nil? && !userid.nil?)
		
	a = Memorie.find(:all,:conditions=>["user_id =? AND id=?",userid,memuserid])
	a.each do |a1|
	
	c = Categories_memorie.find_by_memory_id(a1.id)
	if !c.nil?
	d = Categorie.find_by_id(c.category_id)
	if !d.nil?
		b = User.find_by_id(a1.user_id)
	if !b.nil?
	
	ccount = Comment.find(:all,:conditions =>["memory_id=?",a1.id])
	comcount = count(ccount)
	fll = Following.find(:all, :conditions =>["followee_id= ?",a1.user_id])
	fllcount = count(fll)
	if fllcount > 0
	status = 1
	else
	status = 0
	end
	memusr = Memories_user.find(:all, :conditions =>["memory_id= ? AND user_id=?",a1.id,userid])
	memcount = count(memusr)
	if memcount > 0
	fstatus = 1
	else
	fstatus = 0
	end
	img = Image.find_by_memory_id(a1.id)
	if !img.nil?
	if img.image_file_name!='null'
		pic=img.image_file_name
		else 
		pic="no-image.png"
		end
	else	
	pic="no-image.png"
	end
	
	memusr2 = Memories_user.find(:all, :conditions =>["memory_id=?",a1.id])
	fcount = count(memusr2)
		@msg[i]={"categoryId"=>d.id.to_s,"categoryName"=>d.name,"memorieId"=>a1.id.to_s,"memorieName"=>a1.name,"memorydescription"=>a1.description,"MemoryCreatedDate"=>a1.created_at.to_s,"memorieView"=>a1.views.to_s,"memoriedecade"=>a1.decade.to_s,"coomentscount"=>comcount.to_s,"followscount"=>fllcount.to_s,"status"=>status.to_s,"favstatus"=>fstatus.to_s,"favcount"=>fcount.to_s,"MemorieImage"=>pic,"UserId"=>b.id.to_s,"UserName"=>b.first_name}
		
		
	i=i+1
	
	
	
	
	
	
	end# end for b
	end # end for d
	end #for c
	end
	else 
	@msg[0]={"message"=>"please provide values"} 
	
	end ##for if1	
   
 render :json => @msg
 
  end # For B def.............
  
  /........00.................................................................................................................................................../

  
  #sterting for CGetMemories
  def GetMemories
  catid = 2#params[:catid]
  userid = 1#params[:userid]
  msg1 = Array.new
  msgall = Array.new
  msg3 = Array.new
  msg4 = Array.new
 
  start = params[:start]
  i=0
  j=0
  
  if ((!userid.nil?) && (!catid.nil?))
  usr = User.find_by_id(userid)
  morefive=usr.birth_year+5
  lessfive=usr.birth_year-5
  
  user123 = User.where("birth_year <= :start_date AND birth_year >= :end_date",{:start_date => morefive, :end_date => lessfive})
  user123.each do |f|
	
	img = Image.find_by_user_id(f.id)
	if !img.nil?
	
	if img.image_file_name!='null'
		pic=img.image_file_name
		else 
		pic="no-image.png"
		end
		
	mem = Memorie.find_by_id(img.memory_id)
	if !mem.nil?
	catmem = Categories_memorie.find_by_memory_id(mem.id)
    if !catmem.nil?
	cat = Categorie.find_by_id(catmem.category_id)
	
	if !cat.nil?
	
	commemnt = Comment.find(:all, :conditions =>["memory_id=?",mem.id])
	commentcount = count(commemnt)
	fll = Following.find(:all,:conditions =>["followee_id=?",f.id])
	fcount = count(fll)
	
	if fcount > 0
	status=1
	else
	status = 0
	end
	memusr = Memories_user.find(:all, :conditions=>["memory_id=?",mem.id])
	memcount=count(memusr)
	memusr2 = Memories_user.find(:all, :conditions=>["memory_id=? AND user_id=?",mem.id,userid])
	memcount2=count(memusr2)
	if memcount2 > 0
	fstatus=1
	else
	fstatus=0
	end
	
	
	if (userid != f.id)
	 if ( (lessfive <= f.birth_year) || ( f.birth_year >= morefive))
      if i < 19
	 msg1[i]={"categoryId"=>cat.id.to_s,"categoryName"=>cat.name,"memorieId"=>mem.id.to_s,"memorieName"=>mem.name,"memorieView"=>mem.views.to_s,"memoriedecade"=>mem.decade.to_s,"MemorieImage"=>pic,"MemoryCreatedDate"=>mem.created_at,"UserId"=>f.id.to_s,"UserName"=>f.first_name,"coomentscount"=>commentcount.to_s,"followscount"=>fcount.to_s,"status"=>status.to_s,"description"=>mem.description,"favstatus"=>fstatus.to_s,"favcount"=>memcount2.to_s};
     
	 i =i +1
	  
	  
	  end # end for count


end #for 	 if logic
	
	end #for if (userid != f.id)
  
  
  end # for cat
  end # for catmem
  end # for mem
  end # for img
  
 
  
  end
 
  # one part is compleeted ie userid..suggest
	
	i=0
	msgall = Array.new
	
	usrall = User.find(:all)
	
	usrall.each do |f|
		
	img = Image.find_by_user_id(f.id)
	if !img.nil?
	
	if img.image_file_name!='null'
		pic=img.image_file_name
		else 
		pic="no-image.png"
		end
		
	mem = Memorie.find_by_id(img.memory_id)
	if !mem.nil?
	catmem = Categories_memorie.find_by_memory_id(mem.id)
    if !catmem.nil?
	cat = Categorie.find_by_id(catmem.category_id)
	
	if !cat.nil?
	
	commemnt = Comment.find(:all, :conditions =>["memory_id=?",mem.id])
	commentcount = count(commemnt)
	fll = Following.find(:all,:conditions =>["followee_id=?",f.id])
	fcount = count(fll)
	
	if fcount > 0
	status=1
	else
	status = 0
	end
	memusr = Memories_user.find(:all, :conditions=>["memory_id=?",mem.id])
	memcount=count(memusr)
	memusr2 = Memories_user.find(:all, :conditions=>["memory_id=? AND user_id=?",mem.id,userid])
	memcount2=count(memusr2)
	if memcount2 > 0
	favstatus=1
	else
	favstatus=0
	end
		 
	   msgall[i]={"categoryId"=>cat.id.to_s,"categoryName"=>cat.name,"memorieId"=>mem.id.to_s,"memorieName"=>mem.name,"memorieView"=>mem.views.to_s,"memoriedecade"=>mem.decade,"MemorieImage"=>pic,"MemoryCreatedDate"=>mem.created_at,"UserId"=>f.id.to_s,"UserName"=>f.first_name,"coomentscount"=>commentcount.to_s,"followscount"=>fcount.to_s,"status"=>status.to_s,"description"=>mem.description,"favstatus"=>favstatus.to_s,"favcount"=>memcount2.to_s};
   
	 i =i +1
	  
  end # for cat
  end # for catmem
  end # for mem
  end # for img
  end # end for user all
		
	
	
	
	# starting the catlist proces,,,,,
	j=0
	msg3=Array.new
	cat = Categorie.find_by_id(catid)
	catmem = Categories_memorie.find(:all,:conditions =>["category_id=?",cat.id])
	catmem.each do |c|
	
	mem = Memorie.find_by_id(c.memory_id)
	img = Image.find(:all,:conditions =>["memory_id=?",mem.id])
		if !img.nil?
	img.each do |i|
	
	if i.image_file_name!='null'
		imgpic=i.image_file_name
		else 
		imgpic="no-image.png"
		end
	usr = User.find_by_id(i.user_id)
	coment = Comment.find(:all, :conditions =>["memory_id=?",mem.id])
	comentcount=count(coment)
	f = Following.find(:all,:conditions=>["followee_id=? AND follower_id=?",usr.id,userid])
	
	fcount=count(f)
	if (fcount > 0 )
	status = 1
	else
	status = 0
	end
	memusrc = Memories_user.find(:all,:conditions =>["memory_id=?",mem.id])
	rowfavcount = count(memusrc)
	memusrc2 = Memories_user.find(:all,:conditions =>["memory_id=? AND user_id =?",mem.id,userid])
	memusrcount = count(memusrc2)
	if memusrcount > 0
	fstatus = 1
	else
	fstatus = 0
	end
	
	f1 = Following.find(:all,:conditions=>["followee_id=?",usr.id])
	fcount1=count(f1)
	 if j < 19
      	
	msg3[j]={"categoryId"=>catid.to_s,"categoryName"=>cat.name.to_s,"memorieId"=>mem.id.to_s,"memorieName"=>mem.name.to_s,"memorieView"=>mem.views.to_s,"memoriedecade"=>mem.decade.to_s,"MemorieImage"=>imgpic.to_s,"MemoryCreatedDate"=>mem.created_at.to_s,"UserId"=>usr.id.to_s,"UserName"=>usr.first_name.to_s,"coomentscount"=>comentcount.to_s,"followscount"=>comentcount.to_s,"status"=>status.to_s,"description"=>mem.description.to_s,"favstatus"=>fstatus.to_s,"favcount"=>fcount1.to_s}

	j=j+1
	end
	end #end for img
	end # for imges loop
	end # end for the all catmems
	
	# strting for next task............catsuggest...................................
	
	
	
	
	
	ids = Array.new
	k=0
	cat = Categories_memorie.find(:all,:conditions =>["category_id=?",catid])
	cat.each do |c|
	mem = Memorie.find(:all,:conditions =>["id=?",c.memory_id])
mem.each do |f|

ids[k] = f.user_id
k=k+1

end	
	end
	k=0
	ids=ids.uniq
	msg4=Array.new
	cat = Categorie.find_by_id(catid)
	catmem = Categories_memorie.find(:all,:conditions =>["category_id=?",catid])
	catmem.each do |c|
	
	mem = Memorie.find_by_id(c.memory_id)
	img = Image.find(:all,:conditions =>["memory_id=?",mem.id])
		if !img.nil?
	img.each do |i|
	
	if i.image_file_name!='null'
		imgpic=i.image_file_name
		else 
		imgpic="no-image.png"
		end
	usr = User.find_by_id(i.user_id)
	coment = Comment.find(:all, :conditions =>["memory_id=?",mem.id])
	comentcount=count(coment)
	f = Following.find(:all,:conditions=>["followee_id=? AND follower_id=?",usr.id,userid])
	
	fcount=count(f)
	if (fcount > 0 )
	status = 1
	else
	status = 0
	end
	memusrc = Memories_user.find(:all,:conditions =>["memory_id=?",mem.id])
	rowfavcount = count(memusrc)
	memusrc2 = Memories_user.find(:all,:conditions =>["memory_id=? AND user_id =?",mem.id,userid])
	memusrcount = count(memusrc2)
	if memusrcount > 0
	fstatus = 1
	else
	fstatus = 0
	end
	
	f1 = Following.find(:all,:conditions=>["followee_id=?",usr.id])
	fcount1=count(f1)
	if ( userid != usr.id)
	if((lessfive <= usr.birth_year) || (usr.birth_year >= morefive ))
	
	 if k < 19
      	
msg4[k]={"categoryId"=>catid.to_s,"categoryName"=>cat.name.to_s,"memorieId"=>mem.id.to_s,"memorieName"=>mem.name.to_s,"memorieView"=>mem.views.to_s,"memoriedecade"=>mem.decade.to_s,"MemorieImage"=>imgpic.to_s,"MemoryCreatedDate"=>mem.created_at.to_s,"UserId"=>usr.id.to_s,"UserName"=>usr.first_name.to_s,"coomentscount"=>comentcount.to_s,"followscount"=>comentcount.to_s,"status"=>status.to_s,"description"=>mem.description.to_s,"favstatus"=>fstatus.to_s,"favcount"=>fcount1.to_s}
	
	k=k+1
	end
	end
	end
	end #end for img
	end # for imges loop
	end
	
	
  end
	
	
	
	@msg=Array.new
	@msg[0]={"all"=>msgall}
	@msg[1]={"categories"=>msg3}
	@msg[2]={"suggest"=>msg1}
	@msg[3]={"catsuggest"=>msg4}
	
		
  render :json => @msg
  end # end for GetMemories def
  # here is the end to the CGetMemories  defffff
  
  /.................................................................................................................../
  
   #starting for comments
  def comments
	memuserid =1#params[:memuserid]
	userid =1#params[:userid]
	i=0
	@msg = Array.new
	
	if !memuserid.nil?
	cm1 = Comment.find(:all,:conditions=>["user_id=?",memuserid])
	
	cm1.each do |cm|
	
	cm2 = Comment.find(:all,:conditions=>["user_id=?",cm.user_id])
	countcm2 = count(cm2)
	us = User.find_by_id(cm.user_id)
	mem = Memorie.find_by_id(cm.memory_id)
	if !mem.nil? 
	usr2 = User.find_by_id(mem.user_id)
	img = Image.find_by_memory_id(cm.user_id)
	if img.image_file_name != 'null'
	pic=img.image_file_name 

	else
	pic="no-image.png"
	end
	cm3 = Comment.find(:all,:conditions=>["user_id=?",cm.memory_id])
	countcm3 = count(cm3)
	mem2 = Memorie.find_by_id(cm.memory_id)
	fll = Following.find(:all,:conditions =>["followee_id=? AND follower_id=?",memuserid,userid])
	fcount = count(fll)
	
	if fcount > 0
	status = 1
	else
	status = 0
	end
	cmemory = Categories_memorie.find_by_memory_id(cm.memory_id)
	cat = Categorie.find_by_id ( cmemory.category_id )
	fll2 = Following.find(:all,:conditions =>["followee_id=?",mem2.user_id])
	fcount2 = count(fll2)
	memusr2 = Memories_user.find(:all, :conditions=>["memory_id=? AND user_id=?",cm.memory_id,userid])
	memcount2 = count(memusr2)
	if memcount2 > 0
	fstatus = 1
	else
	fstatus = 0
	end
	 
	
	@msg[i]={"UserId"=>us.id.to_s,"UserName"=>us.first_name,"gender"=>us.gender,"usercommentscount"=>countcm2.to_s,"comments"=>cm.content,"commentcreatedat"=>cm.created_at.to_s,"memorieName"=>mem.name,"memusername"=>usr2.first_name,"coomentscount"=>countcm3.to_s,"MemorieImage"=>pic,"memorieId"=>cm.memory_id.to_s,"status"=>status.to_s,"categoryId"=>cat.id.to_s,"categoryName"=>cat.name,"memoriedecade"=>mem.decade.to_s,"memorieView"=>mem.views.to_s,"followscount"=>fcount2.to_s,"favstatus"=>fstatus.to_s}
	
	i=i+1
	
	
	
	
	
	
	end #for if @mem
	end #end for each
	
	
	
	else
	@msg[0]={"message"=>"please provide values"}
    
	end # for if
  
  render :json => @msg
  end #for def comments
  /..........................................................................comments............................................................................................/
  
  
  
 # starting for the followuser
 
 def followuser
 followeeid = 1#params[:followeeid]
 followerid = 2#params[:followerid]
 @msg = Array.new
 
if (!followeeid.nil? && !followerid.nil?)

ff = Following.find(:all,:conditions =>["followee_id=? AND follower_id=?",followeeid,followerid])
ffcount =count(ff)
if ffcount > 0
Following.delete_all(:followee_id => followeeid)
h={"message"=>"user unfollowed successfully"}
@msg[0]=h
else


ff=Following.new
ff.followee_id = followeeid
ff.follower_id = followerid
ff.save
@msg[0]={"message"=>"followed successfully "} 


end # for if ffcount



else
@msg[0]={"messaage"=>"please provide vali=ues..."}

end #for if 
 render :json => @msg
 end # for foloowuser
 /...................00..................................................................................................../
 
  
  
 # starting for the get category...............
 def getcategories
 
 @msg = Array.new
 
 i=0
 
 cat = Categorie.find(:all)
 cat.each do |c|
 @msg[i]={"catid"=>c.id.to_s,"catname"=>c.name,"catcreatedat"=>c.created_at,"catupdatedat"=>c.updated_at}
 
 i=i+1
 
 
 end # foe each
 
   render :json => @msg
 end # for def getcategories....
 /.....................00............................................................................................../

 
 
 
 # starting for the getcomments
 def getcomments
 
	memoryid = 2#params[:memoryid]
	i=0
	@msg = Array.new
	
	if !memoryid.nil?
	cm =Comment.find(:all,:conditions =>["memory_id=?",memoryid])
	cm.each do |c|
	  	us = User.find_by_id(c.user_id)
		@msg[i]={"commentid"=>c.id.to_s,"content"=>c.content.to_s,"userid"=>c.user_id.to_s,"memoryid"=>c.memory_id.to_s,"createdat"=>c.created_at,"username"=>us.first_name}
		
		i=i+1
	end # foe each cm
	else 
	@msg[0]={"message"=>"please provide the values"}
	
	end # for if
	render :json => @msg
 end # for   def 
 
 /.................00......................................................................................................../
 
 
 # statring for the getshowdown
 def getshowdown
 
i=0

@msg = Array.new

@r= Showdown.find(:all)
@r.each do |r|

@msg[i]={"showdownid"=>r.id.to_s,"userid"=>r.user_id.to_s,"createddate"=>r.created_at,"questiontext"=>r.question,"choice1"=>r.memory_1,"choice2"=>r.memory_2,"choice3"=>r.memory_3,"choice4"=>r.memory_4,"choice5"=>r.memory_5,"choice1image"=>r.image_m1_file_name,"choice2image"=>r.image_m2_file_name,"choice3image"=>r.image_m3_file_name,"choice4image"=>r.image_m4_file_name,"choice5image"=>r.image_m5_file_name,"totalvotes"=>r.votes_count.to_s,"choice1votes"=>r.memory_1_votes_count.to_s,"choice2votes"=>r.memory_2_votes_count.to_s,"choice3votes"=>r.memory_3_votes_count.to_s,"choice4votes"=>r.memory_4_votes_count.to_s,"choice5votes"=>r.memory_5_votes_count.to_s}

i=i+1

end # for # each..



 
render :json => @msg

end # for getshowdown 
 
 
 
 /......................................................................................................................................................../
 
 
 # starting for getuserdetails....................
 def getuserdetails
 
 userid =1#params[:userid]
 i=0
 @msg = Array.new

 if !userid.nil?
 r1 = User.find_by_id(userid)

r2 = Memorie.find(:all,:conditions =>["user_id=?",userid]) 
r2count = count(r2)

r3 = Comment.find(:all,:conditions=>["user_id=?",userid])
r3count = count(r3)
 
 r4 = Following.find(:all,:conditions=>["followee_id=?",userid])
 r4count = count(r4)
 
 r5 = Following.find(:all,:conditions=>["follower_id=?",userid])
 r5count = count(r5)
  
  r6 = Memories_user.find(:all,:conditions=>["user_id=?",userid])
r6count = count(r6)

@msg[i]={"userid"=>userid.to_s,"username"=>r1.first_name,"gender"=>r1.gender,"location"=>r1.zip_code.to_s,"memoriescount"=>r2count.to_s,"commentscount"=>r3count.to_s,"followingcount"=>r5count.to_s,"followedcount"=>r4count.to_s,"rememberedmemories"=>r6count.to_s} 
 
 else 
 @msg[0]={"message"=>"please provide the values"}
 
end # for if 
 render :json => @msg
 
 end #for getuserdetails............ 
 /................................................................................................................................................................................/


 
 #strating for rememberdmemories
 
 def rememberedmemories
 
 

 userid =1# params[:userid]
 i=0

 @msg = Array.new
 if !userid.nil?
 
 r1 = Memories_user.find(:all,:conditions =>["user_id=?",userid])
r1.each do |r|

r8 = Memorie.find_by_id(r.memory_id)
r2 = Comment.find(:all,:conditions=>["memory_id=?",r.memory_id])
r2c = count(r2)
r4 = Categories_memorie.find_by_memory_id(r.memory_id)
r5 = Categorie.find_by_id(r4.category_id)
r3 = User.find_by_id(r8.user_id)
r6 = Image.find_by_memory_id(r8.id)
if r6.image_file_name == 'null'
pic = "no-image.png"

else

pic=r6.image_file_name
end
fc= Following.find(:all,:conditions=>["followee_id=?",r8.user_id])
fcount = count(fc)

f9 = Following.find(:all,:conditions=>["followee_id=? AND follower_id=?",r8.user_id,userid])
f9count = count(f9)
if f9count > 0
status =1
else
status =0
end

r91 = Memories_user.find(:all,:conditions=>["memory_id=? AND user_id=?",r8.id,userid])
r91c = count(r91)
if r91c > 0
fstatus = 1
else
fstatus = 0
end
rfw = Memories_user.find(:all,:conditions=>["memory_id=?",r8.id])
rfwc = count(rfw)
@msg[i]={"categoryId"=>r5.id.to_s,"categoryName"=>r5.name,"UserId"=>r3.id.to_s,"UserName"=>r3.first_name,"memorieId"=>r8.id.to_s,"memoriedecade"=>r8.decade.to_s,"memorieName"=>r8.name,"memorieView"=>r8.views.to_s,"MemorieImage"=>pic,"MemoryCreatedDate"=>r8.created_at,"comentscount"=>r2c.to_s,"followscount"=>f9count.to_s,"followscount"=>r91c.to_s,"status"=>status.to_s,"favstatus"=>fstatus.to_s,"favcount"=>rfwc.to_s}

i=i+1
end # for r. each 
 else
@msg[0]={"message"=>"please enter values"}
 
 end # for if
render :json => @msg
 end # for remembered memories
 
 /......................................................................................................................../
 
 
 
 def result 
 @msg = Array.new

showid = 1#params[:showid]
userid = 1#params[:userid] 
choice = 1#params[:choice]
if ( !choice.nil? && !showid.nil? && !userid.nil? )
c1 = Showdown.find_by_id(showid)

if choice==1
k=c1.memory_1_votes_count
k=k+1
c1.update_attributes(:memory_1_votes_count => k)
end
if choice==2
k=c1.memory_2_votes_count
k=k+1
c1.update_attributes(:memory_2_votes_count => k)
end
if choice==3
k=c1.memory_3_votes_count
k=k+1
c1.update_attributes(:memory_3_votes_count => k)
end
if choice==4
k=c1.memory_4_votes_count
k=k+1
c1.update_attributes(:memory_4_votes_count => k)
end
if choice==5
k=c1.memory_5_votes_count
k=k+1
c1.update_attributes(:memory_5_votes_count => k)
end
k=c1.votes_count
k=k+1
c1.update_attributes(:votes_count => k)
@msg[0]={"message"=>"Voted successfully.."}
else
@msg[0]={"message"=>"please provide the values"}
end# for if...



 render :json => @msg
 end # for result.....

 /.................................................................................................................................................................../
 

 # starting for search.....
  def search
  @msg = Array.new
  msg = Array.new
  msg1 = Array.new
  userid = 1#params[:userid]
  catid =2# params[:catid]
  search = 'Cars'#params[:sarch]
  
  if !search.nil?
  i=0
  # for categoriee base...
  d1 =Categorie.find_by_id(catid)
  c1 = Categories_memorie.find(:all,:conditions=>["category_id=?",catid])
  c1.each do |c|
  
	a1 = Memorie.find_by_id(c.memory_id)
	b1 = User.find_by_id(a1.user_id)
	
	coment = Comment.find(:all,:conditions=>["memory_id=?",a1.id])
	ccount = count(coment)
	
	
	i1 = Image.find_by_memory_id(a1.id)
	if (i1.image_file_name !='null')
	pic=i1.image_file_name
else

pic="no-image.png"
end
	m = Memories_user.find(:all,:conditions=>["memory_id=?",a1.id])
	mcount =count(m)
	mu = Memories_user.find(:all,:conditions=>["memory_id=? AND user_id=?",a1.id,userid])
	mucount = count(mu)
	if mucount > 0
	fstatus = 1
	else 
	fstatus = 0
	end
	f = Following.find(:all,:conditions=>["followee_id=?",b1.id])
	fcount = count(f)
	
	ff = Following.find(:all,:conditions=>["followee_id=? AND follower_id=?",b1.id,userid])
  
	ffc = count(ff)

  if ffc > 0
	status = 1
	else
	fsatus =0
	end
 msg1[i]={"categoryId"=>d1.id.to_s,"categoryName"=>d1.name,"memorieId"=>a1.id.to_s,"memorieName"=>a1.name,"memorieView"=>a1.views.to_s,"memoriedecade"=>a1.decade.to_s,"MemorieImage"=>pic,"MemoryCreatedDate"=>a1.created_at,"UserId"=>b1.id.to_s,"UserName"=>b1.first_name,"coomentscount"=>ccount.to_s,"followscount"=>fcount.to_s,"status"=>status.to_s,"favstatus"=>fstatus.to_s,"favcount"=>mcount.to_s}

 i=i+1

  end # for each...
 
 i=0
 a1 = Memorie.where("name like ?","%#{search}%")
 a1.each do |a|
 b = User.find_by_id(a.user_id)
 c = Categories_memorie.find(:all,:conditions=>["memory_id=?",a.id])
  c.each do |c|

d = Categorie.find_by_id(c.category_id)
coment = Comment.find(:all,:conditions=>["memory_id=?",a.id])
	ccount = count(coment)
	i1 = Image.find_by_memory_id(a.id)
	if (i1.image_file_name !='null')
	pic=i1.image_file_name
else

pic="no-image.png"
end
	m = Memories_user.find(:all,:conditions=>["memory_id=?",a.id])
	mcount =count(m)
	mu = Memories_user.find(:all,:conditions=>["memory_id=? AND user_id=?",a.id,userid])
	mucount = count(mu)
	if mucount > 0
	fstatus = 1
	else 
	fstatus = 0
	end
	f = Following.find(:all,:conditions=>["followee_id=?",b.id])
	fcount = count(f)
	ff = Following.find(:all,:conditions=>["followee_id=? AND follower_id=?",b.id,userid])
  	ffc = count(@ff)

  if ffc > 0
	status = 1
	else
	fsatus =0
	end

msg[i]={"categoryId"=>d1.id.to_s,"categoryName"=>d1.name,"memorieId"=>a.id.to_s,"memorieName"=>a.name,"memorieView"=>a.views.to_s,"memoriedecade"=>a.decade.to_s,"MemorieImage"=>pic,"MemoryCreatedDate"=>a.created_at,"UserId"=>b.id.to_s,"UserName"=>b.first_name,"coomentscount"=>ccount.to_s,"followscount"=>fcount.to_s,"status"=>status.to_s,"favstatus"=>fstatus.to_s,"favcount"=>mcount.to_s}

i=i+1

end # for c.each  
 
 
 end # for a.each
 
 
 
  
  
  @msg[0]={"search"=>msg1,"category"=>msg}
  else 
   @msg[0]={"message"=>"please provide values"}

  end # for if
  
  render :json => @msg
  end # for  search....
 /.................................................................................................................................................................../
 
 
 
 
 
 # starting for the signin  
 def signin
 fname = params[:fname]
 lname = params[:lname]
 dob = params[:dob]
 email = params[:email]
 gender = params[:gender]
 #userbane=params[:username]
 password = params[:password]
 imagename=params[:imagename]
 imagetype=params[:type]
 size=params[:size] # here the sizeis 
 zipcode=params[:zipcode]
 aboutme=params[:aboutme]
 @msg = Array.new
 
 if ( !fname.nil? && !lname.nil? && !dob.nil? && !email.nil? && !password.nil? )

e =User.where("email like ?","#{email}")
emcount = count(@e)
if emcount ==1
e.each do |gh|
@msg[0]={"message"=>"Email is already existed"}
#,"userid"=>gh.id.to_s,"fname"=>gh.first_name,"lname"=>lname,"dob"=>dob.to_s,"email"=>email}
end # for each
else
u=User.new
u.first_name=fname
u.last_name = lname
u.birth_year=dob
u.email = email
u.gender = gender
t=Time.now
u.haslocalpw=0
u.created_at=t
u.encrypted_password = password# here we can change the code as u need for encryption
u.profile_image_file_name=imagename
u.profile_image_content_type=imagetype
u.profile_image_file_size=size
u.zip_code=zipcode
u.about_me=aboutme



if u.save
b(email)
u1 = User.find_by_email(email)
@msg[0]={"message"=>"Signup successfull and login details are send to your Emails"}#"userid"=>@u1.id.to_s,"fname"=>@u1.first_name,"lname"=>lname,"dob"=>dob.to_s,"email"=>email

else 
@msg[0]={"message"=>"failed"}

end

end
 else
 @msg[0]={"message"=>"please provide values..."}

 
 end # for if
 
 render :json => @msg
 end  # for signin
 /.................................................................................................................................................................................../
 
 
 
 

def views

memoryid =1#params[:memoryid]
@msg = Array.new

if !memoryid.nil?
v = Memorie.find_by_id(memoryid)
i=v.views.to_i
i=(i+1).to_s
v.update_attributes(:views => i)

@msg[0]=v
else
@msg[0]={"message"=>"please provide the values"}

end

render :json => @msg
end # for vieww
 
 
 /.................................................................................................................................................................................../
 
 
 
 # starting for the user comment
 def usercomments
 userid =1# params[:userid]
 i=0

 @msg = Array.new
 if !userid.nil?
 r0 = Comment.find(:all,:conditions=>["user_id =?",userid])
r0.each do |r|

r1 = Comment.find(:all,:conditions=>["user_id=?",r.user_id])
r1count = count(r1)
r2 = User.find_by_id(r.user_id)
r3 = Memorie.find_by_id(r.memory_id)
r4 = User.find_by_id(r3.user_id)
r5 = Image.find_by_memory_id(r.memory_id)

if r5.image_file_name != 'null'
pic=r5.image_file_name
else

pic="no-image.png"
end

r6 = Comment.find(:all,:conditions=>["memory_id =?",r.memory_id])
r6count = count(r6)

r9 = Following.find(:all,:conditions=>["followee_id=? AND follower_id=?",r3.user_id,userid])
r9count = count(r9)
if r9count > 0
status = 1
else
status = 0
end
rcm = Categories_memorie.find_by_memory_id(r.memory_id)
rwcat = Categorie.find_by_id(rcm.category_id)
r10 = Following.find(:all,:conditions=>["followee_id=?",r3.user_id])
r10count = count(r10)
r91 = Memories_user.find(:all,:conditions=>["memory_id=? AND user_id=?",r.memory_id,userid])
r91count = count(r91)
if r91count > 0
fstatus = 1
else
fstatus = 0
end
@msg[i]={"UserId"=>r2.id.to_s,"UserName"=>r2.first_name,"gender"=>r2.gender,"usercommentscount"=>r1count.to_s,"comments"=>r.content,"commentcreatedat"=>r.created_at,"memorieName"=>r3.name,"memusername"=>r4.first_name,"coomentscount"=>r6count.to_s,"MemorieImage"=>pic,"memorieId"=>r.memory_id.to_s,"status"=>status.to_s,"categoryId"=>rwcat.id.to_s,"categoryName"=>rwcat.name,"memoriedecade"=>r3.decade.to_s,"memorieView"=>r3.views.to_s,"followscount"=>r10count.to_s,"favstatus"=>fstatus.to_s}
i=i+1
end # for each
 else
 @msg[0]={"message"=>"please provide values"}

end # for if 

 render :json => @msg
 end # for  usercomment
 
 /............................................................................................................................................................./
 
 
 
 # startin for the userfollowedby
 def userfollowedby

 
userid =2#params[:userid]
@msg = Array.new
if !userid.nil?
i=0
r0 = Following.find(:all,:conditions=>["followee_id=?",userid])
r0.each do|r|
r1 = User.find_by_id(r.follower_id)


r2 = Memorie.find(:all,:conditions=>["user_id=?",r.follower_id])
r2count = count(r2)
r3 = Comment.find(:all,:conditions=>["user_id=?",r.follower_id])
r3count = count(r3)
r4 = Memories_user.find(:all,:conditions=>["user_id=?",r.follower_id])
r4count = count(r4)
@msg[i]={"followedbyid"=>r.follower_id.to_s,"fusername"=>r1.first_name,"submitted"=>r2count.to_s,"comments"=>r3count.to_s,"fav"=>r4count.to_s}
i=i+1
end # for each....
else
@msg[0]={"message"=>"please provide values.."}

end

render :json => @msg
 end # for user followed by
 /...................................................................................................................................................../
 
 
 
 
 #starting for the userfollowing
 def userfollowing
 userid = 2#params[:userid]
@msg = Array.new
if !userid.nil?
i=0
r0 = Following.find(:all,:conditions=>["followee_id=?",userid])
r0.each do|r|
r1 = User.find_by_id(r.follower_id)
r2 = Memorie.find(:all,:conditions=>["user_id=?",r.follower_id])
r2count = count(r2)
r3 = Comment.find(:all,:conditions=>["user_id=?",r.follower_id])
r3count = count(r3)
r4 = Memories_user.find(:all,:conditions=>["user_id=?",r.follower_id])
r4count = count(r4)
@msg[i]={"followedbyid"=>r.follower_id.to_s,"fusername"=>r1.first_name,"submitted"=>r2count.to_s,"comments"=>r3count.to_s,"fav"=>r4count.to_s}
i=i+1
end # for each....

else

@msg[0]={"message"=>"please provide values.."}

end # for if

render :json=>@msg
 end # for userfollowing......
 /.................................................................................................................................................................................../
 
 
 


  #starting for the userrememberedmemories
  def userrememberedmemories
  userid = 3#params[:userid]
  i=0

  @msg = Array.new
  if !userid.nil?
  r0 = Memories_user.find(:all,:conditions=>["user_id=?",userid])
  r0.each do |r|
  r1 = Memorie.find_by_id(r.memory_id)
  r2 = Comment.find(:all,:conditions=>["memory_id=?",r.memory_id])
  r2c = count(r2)
  r4 = Categories_memorie.find_by_memory_id(r1.id)
  r5 = Categorie.find_by_id(r4.category_id)
  r3 = User.find_by_id(r1.user_id)
  r6 = Image.find_by_memory_id(r1.id)
  if r6.image_file_name == 'null'
  pic="no-image.png"
  else
  pic=r6.image_file_name
end
r10 = Following.find(:all,:conditions=>["followee_id=?",r.user_id])
follow = count(r10)
r11 = Following.find(:all,:conditions=>["followee_id=? AND follower_id=?",r.user_id,userid])
chk9 = count(r11)
if chk9 > 0
status = 1
else 
status = 0
end
c91 = Memories_user.find(:all,:conditions=>["memory_id=? AND user_id =?",r1.id,userid])
chk91 = count(c91)
if  chk91 > 0
fstatus = 1
else
fstatus = 0
end

rwf = Memories_user.find(:all,:conditions=>["memory_id=?",r1.id])
rwfc = count(rwf)
@msg[i]={"categoryId"=>r5.id,"categoryName"=>r5.name,"UserId"=>r3.id,"UserName"=>r3.first_name,"memorieId"=>r1.id,"memorieName"=>r1.name,"memorieView"=>r1.views,"memoriedecade"=>r1.decade,"MemorieImage"=>pic,"MemoryCreatedDate"=>r1.created_at,"coomentscount"=>r2c,"followscount"=>follow,"status"=>status,"favstatus"=>fstatus,"favcount"=>rwfc}
i= i+1
  end # for each
  else
  
@msg[0]={"message"=>"please provide values"}
 end
  
    render :json => @msg
  end # for user remembered memories
/..................................................................................................................................................................................../  


  # starting for emailconform
  def emailconform
  userid = 151 #params[:userid]
  text = 'hai'#params[:text]

  @msg = Array.new
 if !userid.nil?
 @u = User.find_by_id(userid)
text = b(@u.email)
@msg[0]={"message"=>"Message success fully sent!!"}

 else
 @msg[0]={"message"=>"please provide values.."}
  
  end # for if
 
 render :json => @msg
  end # for email conform
  
  /........................................................................................................../
  





end
