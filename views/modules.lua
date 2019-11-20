--
-- User: Glastis
-- Date: 15-Nov-19
--

local composer = require 'composer'
local mui = require 'materialui.mui'
local views = require 'views.common'
local utilitie = require 'common.utilities'
local json = require 'common.json'

views.set_active_view(2)

local scene = composer.newScene()

local background
local widget = require( "widget" )
local muiData = require( "materialui.mui-data" )

local intra_retval = [[{"good":[{"id":24814,"title_cn":null,"semester":9,"num":"1","begin":"2019-09-01","end":"2020-05-01","end_register":"2020-03-01","scolaryear":2019,"code":"M-PRO-745","codeinstance":"PAR-9-1","location_title":"Paris","instance_location":"FR\/PAR","flags":"2","credits":"12","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - Part-Time Job","register_deadline":103,"seat_taken":714},{"id":25378,"title_cn":null,"semester":9,"num":"4","begin":"2019-09-02","end":"2020-04-19","end_register":"2020-02-11","scolaryear":2019,"code":"M-REA-902","codeinstance":"PAR-9-4","location_title":"Paris","instance_location":"FR\/PAR","flags":"2","credits":"6","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - React Native Mobile Development","register_deadline":84,"seat_taken":18,"seat_free":100},{"id":25235,"title_cn":null,"semester":9,"num":"4","begin":"2019-10-16","end":"2019-12-29","end_register":"2019-11-26","scolaryear":2019,"code":"M-ALG-901","codeinstance":"PAR-9-4","location_title":"Paris","instance_location":"FR\/PAR","flags":"2","credits":"5","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - Artificial Intelligence Introduction","register_deadline":7,"seat_taken":46,"seat_free":60},{"id":25156,"title_cn":null,"semester":9,"num":"1","begin":"2019-09-01","end":"2020-01-12","end_register":"2019-12-02","scolaryear":2019,"code":"M-LYN-002","codeinstance":"PAR-9-1","location_title":"Paris","instance_location":"FR\/PAR","flags":"2","credits":"5","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - How to deploy and scale a machine learning (A.I) pipeline [Lyon]","register_deadline":13,"seat_taken":29},{"id":24780,"title_cn":null,"semester":9,"num":"1","begin":"2019-09-01","end":"2020-02-02","end_register":"2019-11-19","scolaryear":2019,"code":"M-IOT-200","codeinstance":"PAR-9-1","location_title":"Paris","instance_location":"FR\/PAR","flags":"2","credits":"5","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - IoT","register_deadline":0,"seat_taken":51,"seat_free":60},{"id":24781,"title_cn":null,"semester":9,"num":"2","begin":"2019-09-01","end":"2020-03-01","end_register":"2019-12-17","scolaryear":2019,"code":"M-IOT-200","codeinstance":"PAR-9-2","location_title":"Paris","instance_location":"FR\/PAR","flags":"2","credits":"5","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - IoT","register_deadline":28,"seat_taken":49,"seat_free":100},{"id":24790,"title_cn":null,"semester":9,"num":"2","begin":"2019-09-01","end":"2019-12-15","end_register":"2019-11-26","scolaryear":2019,"code":"M-SEC-902","codeinstance":"PAR-9-2","location_title":"Paris","instance_location":"FR\/PAR","flags":"2","credits":"4","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - Web Security","register_deadline":7,"seat_taken":59,"seat_free":85},{"id":24787,"title_cn":null,"semester":9,"num":"1","begin":"2019-09-01","end":"2020-02-02","end_register":"2019-12-17","scolaryear":2019,"code":"M-OPS-902","codeinstance":"PAR-9-1","location_title":"Paris","instance_location":"FR\/PAR","flags":"2","credits":"4","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - DevOps","register_deadline":28,"seat_taken":59,"seat_free":85},{"id":25379,"title_cn":null,"semester":9,"num":"2","begin":"2019-09-02","end":"2020-03-29","end_register":"2020-02-25","scolaryear":2019,"code":"M-OPS-902","codeinstance":"PAR-9-2","location_title":"Paris","instance_location":"FR\/PAR","flags":"2","credits":"4","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - DevOps","register_deadline":98,"seat_taken":18,"seat_free":60},{"id":24762,"title_cn":null,"semester":9,"num":"2","begin":"2019-09-01","end":"2020-02-09","end_register":"2019-12-17","scolaryear":2019,"code":"M-PRO-001","codeinstance":"PAR-9-2","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"3","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - Management de l'Innovation","register_deadline":28,"seat_taken":27,"seat_free":200},{"id":24981,"title_cn":null,"semester":0,"num":"1","begin":"2019-09-01","end":"2020-08-23","end_register":"2020-07-31","scolaryear":2019,"code":"G-EPI-106","codeinstance":"PAR-0-1","location_title":"Paris","instance_location":"FR\/PAR","flags":"2","credits":"3","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M0 - Hack-a-rush","register_deadline":255,"seat_taken":64},{"id":24700,"title_cn":null,"semester":9,"num":"1","begin":"2019-09-01","end":"2020-01-18","end_register":"2020-01-14","scolaryear":2019,"code":"M-PRO-900","codeinstance":"PAR-9-1","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"3","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - Start-up creation","register_deadline":56,"seat_taken":30,"seat_free":25},{"id":25233,"title_cn":null,"semester":9,"num":"3","begin":"2019-10-01","end":"2020-04-11","end_register":"2020-03-09","scolaryear":2019,"code":"M-TRV-006","codeinstance":"PAR-9-3","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"3","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - Intelligence Economique","register_deadline":111,"seat_taken":17,"seat_free":60},{"id":25103,"title_cn":null,"semester":9,"num":"1","begin":"2019-09-01","end":"2019-12-14","end_register":"2019-12-09","scolaryear":2019,"code":"M-MTP-001","codeinstance":"PAR-9-1","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"3","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - Design XP [Montpellier]","register_deadline":20,"seat_taken":10,"seat_free":100},{"id":25232,"title_cn":null,"semester":9,"num":"2","begin":"2019-10-01","end":"2020-02-15","end_register":"2020-01-13","scolaryear":2019,"code":"M-TRV-006","codeinstance":"PAR-9-2","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"3","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - Intelligence Economique","register_deadline":55,"seat_taken":29,"seat_free":60},{"id":24785,"title_cn":null,"semester":9,"num":"2","begin":"2019-09-01","end":"2019-12-15","end_register":"2019-12-10","scolaryear":2019,"code":"M-WEB-901","codeinstance":"PAR-9-2","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"2","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - Progressive Web Apps - Seminar","register_deadline":21,"seat_taken":51,"seat_free":85},{"id":24185,"title_cn":null,"semester":9,"num":"2","begin":"2019-09-01","end":"2019-12-14","end_register":"2019-11-19","scolaryear":2019,"code":"M-PRO-870","codeinstance":"PAR-9-2","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"2","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - Professional Efficiency (Tips and tricks to define your professional style)","register_deadline":0,"seat_taken":13,"seat_free":30},{"id":24210,"title_cn":null,"semester":9,"num":"7","begin":"2019-09-01","end":"2020-02-29","end_register":"2019-11-28","scolaryear":2019,"code":"M-PRO-903","codeinstance":"PAR-9-7","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"2","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - Entretien et n\u00e9gociation : bonnes pratiques","register_deadline":9,"seat_taken":19,"seat_free":30},{"id":24211,"title_cn":null,"semester":9,"num":"8","begin":"2019-09-01","end":"2020-02-29","end_register":"2019-11-28","scolaryear":2019,"code":"M-PRO-903","codeinstance":"PAR-9-8","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"2","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - Entretien et n\u00e9gociation : bonnes pratiques","register_deadline":9,"seat_taken":22,"seat_free":30},{"id":24169,"title_cn":null,"semester":9,"num":"2","begin":"2019-09-01","end":"2019-12-21","end_register":"2019-12-17","scolaryear":2019,"code":"M-TRV-003","codeinstance":"PAR-9-2","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"2","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - Entreprenariat et sources de financements I","register_deadline":28,"seat_taken":59,"seat_free":60},{"id":24829,"title_cn":null,"semester":9,"num":"1","begin":"2019-09-01","end":"2019-11-30","end_register":"2019-11-25","scolaryear":2019,"code":"M-BDX-001","codeinstance":"PAR-9-1","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"2","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - Quality Code [Bordeaux]","register_deadline":6,"seat_taken":23,"seat_free":25},{"id":24784,"title_cn":null,"semester":9,"num":"1","begin":"2019-09-01","end":"2019-12-08","end_register":"2019-12-03","scolaryear":2019,"code":"M-WEB-901","codeinstance":"PAR-9-1","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"2","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - Progressive Web Apps - Seminar","register_deadline":14,"seat_taken":45,"seat_free":50},{"id":23664,"title_cn":null,"semester":0,"num":"1","begin":"2019-08-11","end":"2020-06-23","end_register":"2020-01-14","scolaryear":2019,"code":"G-EPI-010","codeinstance":"PAR-0-1","location_title":"Paris","instance_location":"FR\/PAR","flags":"32","credits":"1","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"S0 - Extra Curricular Engagement","register_deadline":56,"seat_taken":509},{"id":24167,"title_cn":null,"semester":9,"num":"2","begin":"2019-09-01","end":"2019-11-22","end_register":"2019-11-19","scolaryear":2019,"code":"M-PRO-045","codeinstance":"PAR-9-2","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"1","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - Am\u00e9liorez votre communication non verbale en entretien","register_deadline":0,"seat_taken":20,"seat_free":26},{"id":24803,"title_cn":null,"semester":9,"num":"1","begin":"2019-09-01","end":"2020-02-22","end_register":"2020-02-18","scolaryear":2019,"code":"M-XUX-901","codeinstance":"PAR-9-1","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"1","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - UX & Design Thinking","register_deadline":91,"seat_taken":61,"seat_free":60},{"id":24193,"title_cn":null,"semester":9,"num":"4","begin":"2019-09-01","end":"2019-12-06","end_register":"2019-12-02","scolaryear":2019,"code":"M-PRO-060","codeinstance":"PAR-9-4","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"1","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - Boostez votre employabilit\u00e9","register_deadline":13,"seat_taken":14,"seat_free":60},{"id":25249,"title_cn":null,"semester":9,"num":"1","begin":"2019-09-01","end":"2019-12-08","end_register":"2019-12-02","scolaryear":2019,"code":"M-LIL-001","codeinstance":"PAR-9-1","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"1","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - L'informatique dans le retail [Lille]","register_deadline":13,"seat_taken":14,"seat_free":200},{"id":24199,"title_cn":null,"semester":9,"num":"1","begin":"2019-09-01","end":"2019-12-21","end_register":"2019-12-17","scolaryear":2019,"code":"M-PRO-901","codeinstance":"PAR-9-1","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"1","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - Introduction au Lean Start-up","register_deadline":28,"seat_taken":26,"seat_free":30},{"id":24168,"title_cn":null,"semester":9,"num":"2","begin":"2019-09-01","end":"2019-11-29","end_register":"2019-11-26","scolaryear":2019,"code":"M-BYG-001","codeinstance":"PAR-9-2","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"1","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - Combien \u00e7a co\u00fbte ?","register_deadline":7,"seat_taken":19,"seat_free":20}],"ongoing":[{"id":24815,"title_cn":null,"semester":9,"num":"1","begin":"2019-09-01","end":"2021-02-28","end_register":"2019-12-14","scolaryear":2019,"code":"M-PJL-010","codeinstance":"PAR-9-1","location_title":"Paris","instance_location":"FR\/PAR","flags":"3","credits":"12","rights":[],"status":"ongoing","waiting_grades":null,"active_promo":"0","open":"1","title":"M - Projets Libres","register_deadline":25,"seat_taken":352},{"id":24704,"title_cn":null,"semester":9,"num":"2","begin":"2019-09-01","end":"2020-03-08","end_register":"2020-01-07","scolaryear":2019,"code":"M-REA-902","codeinstance":"PAR-9-2","location_title":"Paris","instance_location":"FR\/PAR","flags":"2","credits":"6","rights":[],"status":"ongoing","waiting_grades":null,"active_promo":"0","open":"1","title":"M - React Native Mobile Development","register_deadline":49,"seat_taken":60,"seat_free":170},{"id":24775,"title_cn":null,"semester":9,"num":"2","begin":"2019-09-01","end":"2019-11-24","end_register":"2019-10-22","scolaryear":2019,"code":"M-ALG-901","codeinstance":"PAR-9-2","location_title":"Paris","instance_location":"FR\/PAR","flags":"2","credits":"5","rights":[],"status":"ongoing","waiting_grades":null,"active_promo":"0","open":"0","title":"M - Artificial Intelligence Introduction","seat_taken":48,"seat_free":60},{"id":24760,"title_cn":null,"semester":9,"num":"1","begin":"2019-10-02","end":"2019-11-24","end_register":"2019-11-03","scolaryear":2019,"code":"M-MOB-100","codeinstance":"PAR-9-1","location_title":"Paris","instance_location":"FR\/PAR","flags":"2","credits":"4","rights":[],"status":"ongoing","waiting_grades":null,"active_promo":"0","open":"0","title":"M - Mobile Hybrid - Project","seat_taken":165,"seat_free":20},{"id":25101,"title_cn":null,"semester":9,"num":"1","begin":"2019-09-01","end":"2020-02-28","end_register":"2019-12-16","scolaryear":2019,"code":"M-MRS-001","codeinstance":"PAR-9-1","location_title":"Paris","instance_location":"FR\/PAR","flags":"2","credits":"4","rights":[],"status":"ongoing","waiting_grades":null,"active_promo":"0","open":"1","title":"M - Programmation Objets connect\u00e9s [Marseille]","register_deadline":27,"seat_taken":19,"seat_free":70},{"id":24789,"title_cn":null,"semester":9,"num":"1","begin":"2019-09-01","end":"2019-10-13","end_register":"2019-09-17","scolaryear":2019,"code":"M-SEC-902","codeinstance":"PAR-9-1","location_title":"Paris","instance_location":"FR\/PAR","flags":"2","credits":"4","rights":[],"status":"ongoing","waiting_grades":null,"active_promo":"0","open":"0","title":"M - Web Security","seat_taken":57,"seat_free":60},{"id":24771,"title_cn":null,"semester":9,"num":"1","begin":"2019-09-01","end":"2020-02-09","end_register":"2020-01-14","scolaryear":2019,"code":"M-ALG-103","codeinstance":"PAR-9-1","location_title":"Paris","instance_location":"FR\/PAR","flags":"2","credits":"3","rights":[],"status":"ongoing","waiting_grades":null,"active_promo":"0","open":"1","title":"M - Vizualisation of Massive Data","register_deadline":56,"seat_taken":60,"seat_free":60},{"id":24757,"title_cn":null,"semester":9,"num":"1","begin":"2019-09-01","end":"2020-02-09","end_register":"2019-11-19","scolaryear":2019,"code":"M-PSU-710","codeinstance":"PAR-9-1","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"3","rights":[],"status":"ongoing","waiting_grades":null,"active_promo":"0","open":"1","title":"M - Kernel Programming I","register_deadline":0,"seat_taken":74,"seat_free":100},{"id":24205,"title_cn":null,"semester":9,"num":"3","begin":"2019-09-01","end":"2020-02-22","end_register":"2020-02-18","scolaryear":2019,"code":"M-PRO-902","codeinstance":"PAR-9-3","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"2","rights":[],"status":"ongoing","waiting_grades":null,"active_promo":"0","open":"1","title":"M - Les cl\u00e9s du cadrage de projet","register_deadline":91,"seat_taken":30,"seat_free":30},{"id":24173,"title_cn":null,"semester":9,"num":"2","begin":"2019-09-01","end":"2019-12-07","end_register":"2019-12-03","scolaryear":2019,"code":"M-TRV-002","codeinstance":"PAR-9-2","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"2","rights":[],"status":"ongoing","waiting_grades":null,"active_promo":"0","open":"1","title":"M - Marketing I","register_deadline":14,"seat_taken":53,"seat_free":60},{"id":24178,"title_cn":null,"semester":9,"num":"2","begin":"2019-09-01","end":"2019-11-30","end_register":"2019-11-26","scolaryear":2019,"code":"M-TRV-001","codeinstance":"PAR-9-2","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"2","rights":[],"status":"ongoing","waiting_grades":null,"active_promo":"0","open":"1","title":"M - Strategy I","register_deadline":7,"seat_taken":50,"seat_free":50},{"id":24212,"title_cn":null,"semester":9,"num":"4","begin":"2019-09-01","end":"2020-03-28","end_register":"2020-03-03","scolaryear":2019,"code":"M-PRO-870","codeinstance":"PAR-9-4","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"2","rights":[],"status":"ongoing","waiting_grades":null,"active_promo":"0","open":"1","title":"M - Professional Efficiency (Tips and tricks to define your professional style)","register_deadline":105,"seat_taken":29,"seat_free":30},{"id":24194,"title_cn":null,"semester":9,"num":"5","begin":"2019-09-01","end":"2020-02-07","end_register":"2020-02-04","scolaryear":2019,"code":"M-PRO-002","codeinstance":"PAR-9-5","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"1","rights":[],"status":"ongoing","waiting_grades":null,"active_promo":"0","open":"1","title":"M - Mieux se conna\u00eetre et comprendre les autres par le mod\u00e8le de l'Enn\u00e9agramme","register_deadline":77,"seat_taken":30,"seat_free":30},{"id":24202,"title_cn":null,"semester":9,"num":"2","begin":"2019-09-01","end":"2020-02-28","end_register":"2020-02-25","scolaryear":2019,"code":"M-PRO-901","codeinstance":"PAR-9-2","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"1","rights":[],"status":"ongoing","waiting_grades":null,"active_promo":"0","open":"1","title":"M - Introduction au Lean Start-up","register_deadline":98,"seat_taken":30,"seat_free":30},{"id":24186,"title_cn":null,"semester":9,"num":"3","begin":"2019-09-01","end":"2019-11-08","end_register":"2019-11-04","scolaryear":2019,"code":"M-PRO-060","codeinstance":"PAR-9-3","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"1","rights":[],"status":"ongoing","waiting_grades":null,"active_promo":"0","open":"0","title":"M - Boostez votre employabilit\u00e9","seat_taken":29,"seat_free":60},{"id":25377,"title_cn":null,"semester":9,"num":"2","begin":"2019-09-01","end":"2020-02-01","end_register":"2020-01-28","scolaryear":2019,"code":"M-XUX-901","codeinstance":"PAR-9-2","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"1","rights":[],"status":"ongoing","waiting_grades":null,"active_promo":"0","open":"1","title":"M - UX & Design Thinking","register_deadline":70,"seat_taken":17,"seat_free":100},{"id":23710,"title_cn":null,"semester":9,"num":"1","begin":"2019-09-01","end":"2021-08-31","end_register":"2019-09-01","scolaryear":2019,"code":"M-ADM-850","codeinstance":"PAR-9-1","location_title":"Paris","instance_location":"FR\/PAR","flags":"64","credits":"0","rights":[],"status":"ongoing","waiting_grades":null,"active_promo":"0","open":"0","title":"M - Administrative Meetings","seat_taken":934,"seat_free":200}],"full":[{"id":24701,"title_cn":null,"semester":9,"num":"1","begin":"2019-09-01","end":"2019-11-10","end_register":"2019-09-10","scolaryear":2019,"code":"M-REA-901","codeinstance":"PAR-9-1","location_title":"Paris","instance_location":"FR\/PAR","flags":"2","credits":"6","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"0","title":"M - JavaScript Full Stack Development","seat_taken":60,"seat_free":60},{"id":24702,"title_cn":null,"semester":9,"num":"1","begin":"2019-09-01","end":"2020-03-01","end_register":"2019-12-17","scolaryear":2019,"code":"M-REA-902","codeinstance":"PAR-9-1","location_title":"Paris","instance_location":"FR\/PAR","flags":"2","credits":"6","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - React Native Mobile Development","register_deadline":28,"seat_taken":60,"seat_free":60},{"id":24703,"title_cn":null,"semester":9,"num":"2","begin":"2019-09-01","end":"2019-11-17","end_register":"2019-09-17","scolaryear":2019,"code":"M-REA-901","codeinstance":"PAR-9-2","location_title":"Paris","instance_location":"FR\/PAR","flags":"2","credits":"6","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"0","title":"M - JavaScript Full Stack Development","seat_taken":60,"seat_free":60},{"id":24779,"title_cn":null,"semester":9,"num":"1","begin":"2019-09-01","end":"2020-02-02","end_register":"2020-01-07","scolaryear":2019,"code":"M-GAM-901","codeinstance":"PAR-9-1","location_title":"Paris","instance_location":"FR\/PAR","flags":"2","credits":"5","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - Game design II","register_deadline":49,"seat_taken":50,"seat_free":50},{"id":24817,"title_cn":null,"semester":9,"num":"1","begin":"2019-09-01","end":"2019-12-22","end_register":"2019-12-10","scolaryear":2019,"code":"M-TRV-006","codeinstance":"PAR-9-1","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"3","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - Intelligence Economique","register_deadline":21,"seat_taken":60,"seat_free":60},{"id":24804,"title_cn":null,"semester":9,"num":"1","begin":"2019-09-01","end":"2020-03-08","end_register":"2020-01-28","scolaryear":2019,"code":"M-MGT-100","codeinstance":"PAR-9-1","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"3","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - Management interculturel","register_deadline":70,"seat_taken":60,"seat_free":60},{"id":24771,"title_cn":null,"semester":9,"num":"1","begin":"2019-09-01","end":"2020-02-09","end_register":"2020-01-14","scolaryear":2019,"code":"M-ALG-103","codeinstance":"PAR-9-1","location_title":"Paris","instance_location":"FR\/PAR","flags":"2","credits":"3","rights":[],"status":"ongoing","waiting_grades":null,"active_promo":"0","open":"1","title":"M - Vizualisation of Massive Data","register_deadline":56,"seat_taken":60,"seat_free":60},{"id":24809,"title_cn":null,"semester":9,"num":"2","begin":"2019-09-01","end":"2020-01-12","end_register":"2019-12-10","scolaryear":2019,"code":"M-PRO-750","codeinstance":"PAR-9-2","location_title":"Paris","instance_location":"FR\/PAR","flags":"2","credits":"3","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - Entrepreneurship \u2013The Cantillon","register_deadline":21,"seat_taken":30,"seat_free":30},{"id":24768,"title_cn":null,"semester":9,"num":"2","begin":"2019-09-01","end":"2020-01-26","end_register":"2020-01-07","scolaryear":2019,"code":"M-ALG-102","codeinstance":"PAR-9-2","location_title":"Paris","instance_location":"FR\/PAR","flags":"2","credits":"3","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - Graphs algorithms and matching","register_deadline":49,"seat_taken":60,"seat_free":60},{"id":24158,"title_cn":null,"semester":9,"num":"1","begin":"2019-09-01","end":"2019-10-05","end_register":"2019-09-30","scolaryear":2019,"code":"M-TRV-003","codeinstance":"PAR-9-1","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"2","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"0","title":"M - Entreprenariat et sources de financements I","seat_taken":60,"seat_free":60},{"id":24192,"title_cn":null,"semester":9,"num":"3","begin":"2019-09-01","end":"2020-02-22","end_register":"2020-01-28","scolaryear":2019,"code":"M-PRO-870","codeinstance":"PAR-9-3","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"2","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - Professional Efficiency (Tips and tricks to define your professional style)","register_deadline":70,"seat_taken":30,"seat_free":30},{"id":24205,"title_cn":null,"semester":9,"num":"3","begin":"2019-09-01","end":"2020-02-22","end_register":"2020-02-18","scolaryear":2019,"code":"M-PRO-902","codeinstance":"PAR-9-3","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"2","rights":[],"status":"ongoing","waiting_grades":null,"active_promo":"0","open":"1","title":"M - Les cl\u00e9s du cadrage de projet","register_deadline":91,"seat_taken":30,"seat_free":30},{"id":24178,"title_cn":null,"semester":9,"num":"2","begin":"2019-09-01","end":"2019-11-30","end_register":"2019-11-26","scolaryear":2019,"code":"M-TRV-001","codeinstance":"PAR-9-2","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"2","rights":[],"status":"ongoing","waiting_grades":null,"active_promo":"0","open":"1","title":"M - Strategy I","register_deadline":7,"seat_taken":50,"seat_free":50},{"id":24203,"title_cn":null,"semester":9,"num":"2","begin":"2019-09-01","end":"2020-01-18","end_register":"2020-01-14","scolaryear":2019,"code":"M-PRO-902","codeinstance":"PAR-9-2","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"2","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - Les cl\u00e9s du cadrage de projet","register_deadline":56,"seat_taken":30,"seat_free":30},{"id":24175,"title_cn":null,"semester":9,"num":"2","begin":"2019-09-01","end":"2019-11-29","end_register":"2019-11-26","scolaryear":2019,"code":"M-PRO-004","codeinstance":"PAR-9-2","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"1","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - N\u00e9gociation","register_deadline":7,"seat_taken":25,"seat_free":25},{"id":24179,"title_cn":null,"semester":9,"num":"3","begin":"2019-09-01","end":"2019-12-13","end_register":"2019-12-09","scolaryear":2019,"code":"M-PRO-045","codeinstance":"PAR-9-3","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"1","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - Am\u00e9liorez votre communication non verbale en entretien","register_deadline":20,"seat_taken":26,"seat_free":26},{"id":24180,"title_cn":null,"semester":9,"num":"3","begin":"2019-09-01","end":"2020-01-31","end_register":"2020-01-28","scolaryear":2019,"code":"M-BYG-001","codeinstance":"PAR-9-3","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"1","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - Combien \u00e7a co\u00fbte ?","register_deadline":70,"seat_taken":20,"seat_free":20},{"id":24181,"title_cn":null,"semester":9,"num":"3","begin":"2019-09-01","end":"2019-12-06","end_register":"2019-12-03","scolaryear":2019,"code":"M-MNG-900","codeinstance":"PAR-9-3","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"1","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - La bo\u00eete \u00e0 outils du leadership","register_deadline":14,"seat_taken":25,"seat_free":25},{"id":24182,"title_cn":null,"semester":9,"num":"3","begin":"2019-09-01","end":"2020-02-14","end_register":"2020-02-11","scolaryear":2019,"code":"M-AGI-100","codeinstance":"PAR-9-3","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"1","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - Les bases de l'Agilit\u00e9 et de Scrum","register_deadline":84,"seat_taken":30,"seat_free":30},{"id":24172,"title_cn":null,"semester":9,"num":"2","begin":"2019-09-01","end":"2020-01-10","end_register":"2020-01-07","scolaryear":2019,"code":"M-AGI-100","codeinstance":"PAR-9-2","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"1","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - Les bases de l'Agilit\u00e9 et de Scrum","register_deadline":49,"seat_taken":30,"seat_free":30},{"id":24183,"title_cn":null,"semester":9,"num":"3","begin":"2019-09-01","end":"2019-12-20","end_register":"2019-12-17","scolaryear":2019,"code":"M-PRO-002","codeinstance":"PAR-9-3","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"1","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - Mieux se conna\u00eetre et comprendre les autres par le mod\u00e8le de l'Enn\u00e9agramme","register_deadline":28,"seat_taken":30,"seat_free":30},{"id":24184,"title_cn":null,"semester":9,"num":"3","begin":"2019-09-01","end":"2020-01-31","end_register":"2020-01-28","scolaryear":2019,"code":"M-PRO-004","codeinstance":"PAR-9-3","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"1","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - N\u00e9gociation","register_deadline":70,"seat_taken":25,"seat_free":25},{"id":24202,"title_cn":null,"semester":9,"num":"2","begin":"2019-09-01","end":"2020-02-28","end_register":"2020-02-25","scolaryear":2019,"code":"M-PRO-901","codeinstance":"PAR-9-2","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"1","rights":[],"status":"ongoing","waiting_grades":null,"active_promo":"0","open":"1","title":"M - Introduction au Lean Start-up","register_deadline":98,"seat_taken":30,"seat_free":30},{"id":24187,"title_cn":null,"semester":9,"num":"4","begin":"2019-09-01","end":"2020-01-17","end_register":"2020-01-13","scolaryear":2019,"code":"M-PRO-045","codeinstance":"PAR-9-4","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"1","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - Am\u00e9liorez votre communication non verbale en entretien","register_deadline":55,"seat_taken":26,"seat_free":26},{"id":24188,"title_cn":null,"semester":9,"num":"4","begin":"2019-09-01","end":"2020-02-28","end_register":"2020-02-25","scolaryear":2019,"code":"M-BYG-001","codeinstance":"PAR-9-4","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"1","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - Combien \u00e7a co\u00fbte ?","register_deadline":98,"seat_taken":20,"seat_free":20},{"id":24189,"title_cn":null,"semester":9,"num":"4","begin":"2019-09-01","end":"2020-01-10","end_register":"2020-01-07","scolaryear":2019,"code":"M-MNG-900","codeinstance":"PAR-9-4","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"1","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - La bo\u00eete \u00e0 outils du leadership","register_deadline":49,"seat_taken":25,"seat_free":25},{"id":24190,"title_cn":null,"semester":9,"num":"4","begin":"2019-09-01","end":"2020-01-31","end_register":"2020-01-28","scolaryear":2019,"code":"M-PRO-002","codeinstance":"PAR-9-4","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"1","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - Mieux se conna\u00eetre et comprendre les autres par le mod\u00e8le de l'Enn\u00e9agramme","register_deadline":70,"seat_taken":30,"seat_free":30},{"id":24191,"title_cn":null,"semester":9,"num":"4","begin":"2019-09-01","end":"2020-02-14","end_register":"2020-02-11","scolaryear":2019,"code":"M-PRO-004","codeinstance":"PAR-9-4","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"1","rights":[],"status":"notregistered","waiting_grades":null,"active_promo":"1","open":"1","title":"M - N\u00e9gociation","register_deadline":84,"seat_taken":25,"seat_free":25},{"id":24194,"title_cn":null,"semester":9,"num":"5","begin":"2019-09-01","end":"2020-02-07","end_register":"2020-02-04","scolaryear":2019,"code":"M-PRO-002","codeinstance":"PAR-9-5","location_title":"Paris","instance_location":"FR\/PAR","flags":"0","credits":"1","rights":[],"status":"ongoing","waiting_grades":null,"active_promo":"0","open":"1","title":"M - Mieux se conna\u00eetre et comprendre les autres par le mod\u00e8le de l'Enn\u00e9agramme","register_deadline":77,"seat_taken":30,"seat_free":30}]}]]

local progress_error

progress_error = false

local function fill_module_list_part_column(columns, text, id, align)
    columns[#columns + 1] = { text = text, value = id, align = align }

end

local function fill_module_list_part(list, module_part, color)
    local i
    local columns

    i = 1
    url = '/module/' . (isset($module['scolaryear']) ? $module['scolaryear'] : '2019') . '/' . $module['code'] . '/' . $module['codeinstance'] . '/';
    while module_part[i] do
        columns = {}
        fill_module_list_part_column(columns, module_part[i].title, module_part[i].id, 'right')
        if tonumber(module_part[i].credits) > 1 then
            fill_module_list_part_column(columns, module_part[i].credits .. " crédits", module_part[i].id, 'center')
        else
            fill_module_list_part_column(columns, module_part[i].credits .. " crédit", module_part[i].id, 'center')
        end
        if module_part[i].seat_free then
            fill_module_list_part_column(columns, module_part[i].seat_taken .. '/' .. module_part[i].seat_free .. " places", module_part[i].id, 'left')
        else
            fill_module_list_part_column(columns, module_part[i].seat_taken .. ' inscrits', module_part[i].id, 'left')
        end
        list[#list + 1] = { key = module_part[i].id, text = module_part[i].title, value = module_part[i].id, isCategory = false, fillColor = color, columns = columns, fontSize = 10, lineColor = views.background_color, url =  }
        i = i + 1
    end
    return list
end

local function fill_module_list(modules)
    local i
    local list

    i = 1
    list = {}
    list = fill_module_list_part(list, modules.good, views.get_color_ratio(51, 102, 153))
    list = fill_module_list_part(list, modules.ongoing, views.get_color_ratio(179, 134, 0))
    list = fill_module_list_part(list, modules.full, views.get_color_ratio(153, 51, 51))
    return list
end

local function draw_module_list(mui, modules)
    local topInset, leftInset, bottomInset, rightInset = mui.getSafeAreaInsets()
    local padding_y

    if not modules or (not modules['messages'] and not modules['good'])then
        progress_error = 'Erreur lors de la demande de la liste des modules'
        return nil
    end
    utilitie.var_dump(modules, true)
    padding_y = 5
    mui.newTableView({
        parent = mui.getParent(),
        name = "tableview",
        width = display.contentWidth - (leftInset + rightInset) - padding_y * 2,
        height = display.contentHeight - (topInset + bottomInset),
        top = display.screenOriginX + leftInset + 40,
        left = display.screenOriginY + topInset + padding_y,
        font = native.systemFont,
        fontSize = 8,
        textColor = views.background_color,
        lineColor = views.background_color,
        fillColor  = views.background_color,
        lineHeight = 2,
        rowColor = views.background_color, --{ default={1,1,1}, over={1,0.5,0,0.2} },
        rowHeight = 30,
--         rowAnimation = false, -- turn on rowAnimation
        noLines = false,
        callBackTouch = mui.onRowTouchDemo,
        callBackRender = mui.onRowRenderDemo,
        scrollListener = mui.scrollListener,  -- needed if using buttons, etc within the row!

        list = fill_module_list(modules),
        columnOptions = {
            widths = { 60, 60, 60 }, -- must supply each else "auto" is assumed.
        },
        categoryColor = { default = views.background_color },
        categoryLineColor = views.background_color,
        touchpointColor = { 0.4, 0.4, 0.4 },
    })
end


local function get_modules_callback(event)
    event.isError = false
    event.response = intra_retval
    if event.isError then
        print("Network error: ", event.response)
        draw_module_list(mui, nil)
    else
        print("RESPONSE: " .. event.response)
        draw_module_list(mui, json.parse(event.response))
    end
end

local function get_module_list()
    local token
    local params

    token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImNiMzQ0YWY0YzNlYmZmNGRmYTFkOWJkYmI2YzcwYjJmYTM5YTA0YTk2MTY0MDRiYzliYmIwMzYyYjdjM2MwNmZkMGNjYzA0OThlMjU0MDM1In0.eyJhdWQiOiIxIiwianRpIjoiY2IzNDRhZjRjM2ViZmY0ZGZhMWQ5YmRiYjZjNzBiMmZhMzlhMDRhOTYxNjQwNGJjOWJiYjAzNjJiN2MzYzA2ZmQwY2NjMDQ5OGUyNTQwMzUiLCJpYXQiOjE1NzM5NTQ0NzYsIm5iZiI6MTU3Mzk1NDQ3NiwiZXhwIjoxNjA1NTc2ODc1LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.JnIi40_9sSFUDHbrdfobKBz6ebyUxOd37EDVIoKNrgD346Y7-4m8tMxt_NuqmvhvVnNwqjzcoXQstFrduN5djOkoBs57t3p-7tbowjE-zqNWs-24ksd3Z9qwLGdtU7y07Qxv5WSVXWL1wt5N7RBFEBFoP7MlhVOGg-6L0IWe8xRTa29xbmJHjh39z0X3XDaRgvK-_daeLX3_SqJlhWUUoDK3SCzm86Bainhd6T2CALpfLkheMcOOUeLtHXSBYH-HJ-_YKPPPfT6AergbYT3vTXqn5CgK4QP2pZC3aGGcylliZup9ayIcQeUacixrThVL0IZ3waUZm1sZqbrS9-1QBDcEjDnU9RfbvQPNxpbs49-tUItpGYxwEttjSf4zhsSYJnoJyDqTeEfKRqsu7-CB2zzPGkP-RoUoUm7Rs2gu-QQxUfMoW8LmzXzoRjw0oEZSNkHNgiqhn4TwMJYHmXCOYuY4auI__4cfc0a2w7bbyL7Dzck9IhVIxQ6uNCXoUCOrQBzMM0k1orhcHekYUfqZyYE7nVJ-KjcsQTYlNFZxAFlfH8uu1aUAAW2Xxh0IyEb7x-OCbOvrhwBwRNApR4zBZ3Kbz1P8kG96VBdWoyUiPCZy3BCHA5GdbNG7i95KJefD80493OB90mAxZrPnCJTjJ6kSp_yd_LN6A6663zU36v8'
    params = {}
    params.headers = {}
    params.headers["Content-Type"] = "application/json"
    params.headers["Accept"] = "application/json"
    params.headers["Authorization"] = "Bearer " .. token
    network.request("https://google.com", "GET", get_modules_callback, params)
--    network.request("https://new.glastis.com/api/epitech/modules/get", "GET", get_modules_callback, params)
end

local function add_loading_bar()
    local topInset, leftInset, bottomInset, rightInset = mui.getSafeAreaInsets()

--    local function increaseMyProgressBar()
--        print("increaseMyProgressBar")
--        mui.increaseProgressBar("progressbar_demo", 5)
--    end
--
    local back_color = views.get_color_ratio(77,77,77)
    local color = views.get_color_ratio(99,99,99)

    local text_loop_i
    local odd

    text_loop_i = 1
    odd = false
    local function swap_colors()
        local tmp

        tmp = back_color
        back_color = color
        color = tmp
    end

    local function get_text(modif)
        local text

        text = {}
        text[#text + 1] = "Le serveur demande a l'intra"
        text[#text + 1] = "L'intra est lent..."
        text[#text + 1] = "Très lent."
        text[#text + 1] = "En moyenne ca dure 16 secondes"
        text[#text + 1] = "Sinon ca va ?"
        text[#text + 1] = "Ca devrait finir bientot"
        text[#text + 1] = "Je suis une loop de texte"
        text[#text + 1] = "Je vaut bien 4 credits, non ?"
        text[#text + 1] = "2/3 millions de requetes faites"
        text[#text + 1] = "Pain au chocolat ou chocolatine ?"

        if modif then
            if text_loop_i > #text then
                text_loop_i = 1
            else
                text_loop_i = text_loop_i + 1
            end
        end
        return text[text_loop_i]
    end

    local function reset_progress_bar()
        swap_colors()

        if not progress_error then
            mui.setProgressBarProperty('progressbar_demo', {
                foregroundColor = back_color,
                backgroundColor = color,
                labelText = get_text(odd)
            })
        else
            mui.setProgressBarProperty('progressbar_demo', {
                foregroundColor = views.get_color_ratio(153, 0, 0),
                backgroundColor = views.get_color_ratio(153, 0, 0),
                labelText = progress_error,
                percentComplete = 0
            })
        end
        odd = not odd
    end

    mui.newProgressBar({
        name = "progressbar_demo",
        width = 290,
        height = 8,
        x = display.contentCenterX - (290/2),
        y = display.contentCenterY,
        foregroundColor = back_color,
        backgroundColor = color,
        startPercent = 100,
        barType = "determinate",
        iterations = 1000,
        labelText = get_text(),
        labelFont = native.systemFont,
        labelFontSize = 18,
        labelColor = {  0.4, 0.4, 0.4, 1 },
        labelAlign = "center",
        callBack = reset_progress_bar,
        hideBackdropWhenDone = true
    })
end

function scene:create(event)
    local sceneGroup = self.view

    mui.init()
    views.create_background(mui, sceneGroup)
    views.add_header(mui)
    get_module_list()
    add_loading_bar()
end

function scene:show(event)

    local sceneGroup
    local phase

    sceneGroup = self.view
    phase = event.phase
    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen)
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen
        -- Insert code here to make the scene come alive
        -- Example: start timers, begin animation, play audio, etc.
        -- mui.actionSwitchScene({callBackData={sceneDestination="fun"}})
    end
end

function scene:hide(event)

    local sceneGroup
    local phase

    sceneGroup = self.view
    phase = event.phase
    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen)
        -- Insert code here to "pause" the scene
        -- Example: stop timers, stop animation, stop audio, etc.

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen
    end
end

function scene:destroy( event )

    local sceneGroup

    sceneGroup = self.view
    -- Called prior to the removal of scene's view
    -- Insert code here to clean up the scene
    -- Example: remove display objects, save state, etc.
    mui.destroy()

    if background ~= nil then
        background:removeSelf()
        background = nil
    end
    sceneGroup:removeSelf()
    sceneGroup = nil

end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene