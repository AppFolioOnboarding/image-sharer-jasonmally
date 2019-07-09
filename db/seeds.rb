# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
image_list = [['Brahma', 'https://www.townlinehatchery.com/'\
'wp-content/uploads/2014/03/Untitled-design-3.png'],
              ['Salmon Faverolles', 'https://www.strombergschickens.com/'\
              'images/uploads/Salmon-Faverolle-chicken-LG.jpg'],
              ['Silkie', 'https://www.strombergschickens.com/'\
              'images/uploads/White-Silkie-Bantam-Chicken-LG.jpg'],
              ['Polish', 'https://www.mypetchicken.com/'\
              'images/product_images/Popup/_MG_9022.jpg'],
              ['Frizzle', 'https://cdn.shopify.com/'\
              's/files/1/2115/3281/files/image_large.jpg'],
              ['Cochin', 'https://www.purelypoultry.com/'\
              'images/barred-cochin-chickens.jpg'],
              ['Wyandotte', 'http://www.brinkhavenacres.com/'\
              'uploads/3/0/3/4/30347651/s652247499685808326_p48_i11_w600.jpeg'],
              ['Marans Rooster', 'https://www.mypetchicken.com/'\
              'images/product_images/Popup/Black-Copper-Marans-RoosterBHA.jpg'],
              ['Marans Hen', 'https://cdn11.bigcommerce.com/'\
              's-vmvni2zq0j/products/49930/images/66765/1920119__20305.1518795897.500.750.jpg'],
              ['Buff Orpington', 'https://www.mypetchicken.com/'\
              'images/product_images/Popup/BuffOrpington_A4A5214-Edit.jpg'],
              ['Barred Rock', 'https://www.clabornfarms.com/'\
              'wp-content/uploads/2018/06/barred_rock_laying_hen.jpg'],
              ["Mille Fleur d'Uccle", 'https://www.mypetchicken.com/'\
              'images/product_images/Popup/MilleFleurdUccle_A4A4113-Edit.jpg'],
              ['Polish Frizzle', 'https://www.pipinchicksilkies.com/'\
              'uploads/1/2/7/5/12757992/polish-black-laced-frizzle-3_orig.jpg'],
              ['Two Salmon Faverolles', 'https://www.mcmurrayhatchery.com/'\
              'images/global/mc/McMurrayHatchery-Salmon-Faverolles.jpg'],
              ['Salmon Faverolles Chick', 'https://www.mcmurrayhatchery.com/'\
              'images/global/mc/McMurrayHatchery-Salmon-Faverolle-DayOldBabyChick.jpg'],
              ['Three Silkies', 'https://www.mypetchicken.com/images/'\
              'product_images/Popup/SilkieTrio_A4A4990.png'],
              ['Polish Baby Chicks', 'https://secureservercdn.net/'\
              '50.62.194.30/p8d.3d0.myftpupload.com/'\
              'wp-content/uploads/2012/09/Polish-5-30-12-Polish-babies-49.jpg'],
              ['Brahma Chicks', 'https://www.efowl.com/'\
              'wp-content/uploads/2016/12/light_brahma_chickens_cackle_2.jpg'],
              ['Barred Rock Chick', 'https://www.mcmurrayhatchery.com/'\
              'images/global/mc/McMurrayHatchery_BarredRock_BabyChick.jpg'],
              ['Silkie Chick', 'http://cdn.hasshe.com/'\
              'img/s/_NmoJS_httOp0SB9X_0r4QHaG8.jpg']]

image_list.each do |saved_name, saved_url|
  Image.create(name: saved_name, image_url: saved_url)
end
