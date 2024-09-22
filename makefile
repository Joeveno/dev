#
# make sure these definitions fit your setup
#

UTILDIR=../utils/qutils/bin/

QBSP=$(UTILDIR)qbsp
VIS=$(UTILDIR)vis
LIGHT=$(UTILDIR)light
QCC=$(UTILDIR)qcc
MODELGEN=$(UTILDIR)modelgen
SPRGEN=$(UTILDIR)sprgen
QLUMPY=$(UTILDIR)qlumpy
QFILES=$(UTILDIR)qfiles

RM=rm -f
MOVE=mv
COPY=cp

#
# top-level targets (packages?)
#

all: shared_content sp_content dm_maps sp_maps
sp: shared_content sp_content sp_maps
dm: shared_content dm_maps


# be careful, don't erase anything we can't generate
clean:
	$(RM) pak0.pak pak1.pak
	$(RM) progs.dat qwprogs.dat qwdefs.h progdefs.h
	$(RM) gfx/*.lmp gfx.wad
	$(RM) $(addprefix progs/,b_g_key.mdl m_g_key.mdl w_g_key.mdl)
	$(RM) $(addprefix progs/,b_s_key.mdl m_s_key.mdl w_s_key.mdl)
	$(RM) $(addprefix progs/,end1.mdl end2.mdl end3.mdl end4.mdl)
	$(RM) $(addprefix progs/,gib1.mdl gib2.mdl gib3.mdl zom_gib.mdl)
	$(RM) $(addprefix progs/,eyes.mdl flame.mdl flame2.mdl lavaball.mdl)
	$(RM) $(addprefix progs/,laser.mdl armor.mdl backpack.mdl teleport.mdl)
	$(RM) $(addprefix progs/,quaddama.mdl invisibl.mdl invulner.mdl suit.mdl)
	$(RM) $(addprefix progs/,g_light.mdl bolt.mdl bolt2.mdl bolt3.mdl)
	$(RM) $(addprefix progs/,g_nail.mdl g_nail2.mdl s_spike.mdl spike.mdl)
	$(RM) $(addprefix progs/,g_rock.mdl g_rock2.mdl grenade.mdl missile.mdl)
	$(RM) $(addprefix progs/,g_shot.mdl)
	$(RM) $(addprefix progs/,h_player.mdl)
	$(RM) $(addprefix progs/,h_dog.mdl h_guard.mdl h_knight.mdl h_zombie.mdl)
	$(RM) $(addprefix progs/,wizard.mdl h_wizard.mdl)
	$(RM) $(addprefix progs/,s_bubble.spr s_explod.spr s_light.spr)

#
# mid-level targets (.pak files?)
#

shared_content: gfx env sprites boxes qc shared_models shared_sounds pak0.pak

sp_content: sp_models sp_sounds pak1.pak

dm_maps: $(addprefix maps/,\
	am1.bsp\
	void1.bsp\
	void2.bsp\
	void4.bsp\
	void5.bsp\
	start.bsp)

sp_maps: $(addprefix maps/,\
	start.bsp)


#
# low-level targets
#

# shared content

gfx: $(addprefix gfx/,bigbox.lmp box_bl.lmp box_bm.lmp box_br.lmp box_ml.lmp\
	box_mm.lmp box_mm2.lmp box_mr.lmp box_tl.lmp box_tm.lmp box_tr.lmp\
	colormap.lmp complete.lmp conback.lmp\
	dim_drct.lmp dim_ipx.lmp dim_modm.lmp dim_mult.lmp dim_tcp.lmp\
	finale.lmp help0.lmp help1.lmp help2.lmp help3.lmp help4.lmp help5.lmp\
	inter.lmp loading.lmp mainmenu.lmp\
	menudot1.lmp menudot2.lmp menudot3.lmp menudot4.lmp menudot5.lmp menudot6.lmp\
	menuplyr.lmp mp_menu.lmp\
	netmen1.lmp netmen2.lmp netmen3.lmp netmen4.lmp netmen5.lmp\
	p_load.lmp p_multi.lmp p_option.lmp p_save.lmp\
	palette.lmp pause.lmp pop.lmp qplaque.lmp ranking.lmp sell.lmp sp_menu.lmp\
	ttl_cstm.lmp ttl_main.lmp ttl_sgl.lmp\
	vidmodes.lmp)\
	gfx.wad

env: $(addprefix gfx/env/,\
	sqkup.tga sqkdn.tga sqklf.tga sqkrt.tga sqkft.tga sqkbk.tga)

sprites: $(addprefix progs/,s_bubble.spr s_explod.spr s_light.spr)

boxes: $(addprefix maps/,\
	b_batt0.bsp b_batt1.bsp\
	b_bh10.bsp b_bh100.bsp b_bh25.bsp\
	b_exbox2.bsp b_explob.bsp\
	b_nail0.bsp b_nail1.bsp\
	b_rock0.bsp b_rock1.bsp\
	b_shell0.bsp b_shell1.bsp)

qc: progs.dat qwprogs.dat

shared_models: $(addprefix progs/,\
	armor.mdl backpack.mdl teleport.mdl\
	bolt.mdl bolt2.mdl bolt3.mdl\
	b_g_key.mdl m_g_key.mdl w_g_key.mdl\
	b_s_key.mdl m_s_key.mdl w_s_key.mdl\
	end1.mdl end2.mdl end3.mdl end4.mdl\
	flame.mdl flame2.mdl lavaball.mdl\
	grenade.mdl missile.mdl laser.mdl s_spike.mdl spike.mdl\
	gib1.mdl gib2.mdl gib3.mdl zom_gib.mdl\
    g_light.mdl g_nail.mdl g_nail2.mdl g_rock.mdl g_rock2.mdl g_shot.mdl\
	v_light.mdl v_nail.mdl v_nail2.mdl v_rock.mdl v_rock2.mdl v_shot.mdl\
	v_shot2.mdl v_axe.mdl\
	quaddama.mdl invisibl.mdl invulner.mdl suit.mdl eyes.mdl\
	player.mdl zombie.mdl h_player.mdl h_zombie.mdl)

shared_sounds: $(addprefix sound/,\
	$(addprefix ambience/,brikhit2.wav brik_hit.wav distex.wav glassbrk.wav\
	hdrone.wav hdrone1.wav met1.wav met2.wav metbrk.wav methit1.wav\
	methit2.wav regen1.wav sqeak2.wav squeak1.wav wall01.wav woodbrk.wav\
	woodhit1.wav woodhit2.wav wpump1.wav wind2.wav water1.wav)\
	$(addprefix doors/,ddoor1.wav ddoor2.wav hydro1.wav hydro2.wav\
	stndr1.wav stndr2.wav)\
	$(addprefix hknight/,hit.wav)\
	$(addprefix items/,health1.wav sheild1.wav sheild2.wav sheild3.wav\
	itembk2.wav damage3.wav armor1.wav)\
	$(addprefix misc/,drip1.wav drip2.wav drip3.wav foot1.wav foot2.wav\
	foot3.wav foot4.wav null.wav inh2ob.wav menu1.wav menu2.wav menu3.wav\
	outwater.wav owater2.wav quake.wav quakeend.wav rain.wav r_tele1.wav\
	r_tele2.wav spark1.wav spark2.wav spark3.wav spark4.wav talk.wav\
	uwater.wav water2.wav power.wav r_tele3.wav r_tele4.wav r_tele5.wav\
	water1.wav h2ohit1.wav)\
	$(addprefix player/,udeath.wav axhit1.wav teledth1.wav slimbrn2.wav\
	plyrjmp8.wav pain6.wav pain5.wav pain4.wav pain3.wav pain2.wav pain1.wav\
	lburn2.wav lburn1.wav land2.wav land.wav inlava.wav inh2o.wav h2ojump.wav\
	h2odeath.wav gib.wav gasp2.wav gasp1.wav drown2.wav drown1.wav death5.wav\
	death4.wav death3.wav death2.wav death1.wav axhit2.wav tornoff2.wav)\
	$(addprefix weapons/,armed.wav bounce.wav bounce2.wav error.wav\
	gren.wav gren2.wav hog.wav lock4.wav mfire1.wav mfire2.wav minedet.wav\
	mplasex.wav mplasma.wav pkup.wav plasma.wav rhino.wav rhinore.wav r_exp3.wav\
	sawatck.wav sawguts.wav sawhit.wav sawidle.wav sawoff.wav sawon.wav\
	shotgn2.wav shrapdet.wav tink2.wav ts3fire.wav tsfire.wav tsload.wav\
	rocket1i.wav spike2.wav guncock.wav ax1.wav))

# single-player/coop content

sp_models: $(addprefix progs/,\
	dog.mdl knight.mdl enforcer.mdl soldier.mdl wizard.mdl\
	h_dog.mdl h_guard.mdl h_knight.mdl h_wizard.mdl)

sp_sounds: 

pak0.pak:
	$(COPY) pak0.pak.files files.dat
	$(QFILES) -pak 1
	$(MOVE) pak1.pak pak0.pak
	$(RM) files.dat

pak1.pak:
	$(COPY) pak1.pak.files files.dat
	$(QFILES) -pak 1
	$(RM) files.dat

qwprogs.dat:
	$(QCC) -o qwprogs.dat -p qwdefs.h qc_merge/qw.qc

progs.dat:
	$(QCC) -o progs.dat -p progdefs.h qc_merge/quake.qc

gfx.wad :
	$(QLUMPY) gfx_wad.ls

%.lmp :
	$(QLUMPY) gfx_lmp.ls

%.mdl : %.qc
	$(MODELGEN) $<

%.spr : %.qc %.png
	$(SPRGEN) $<

%.bsp : %.map
	$(QBSP) $<
	$(VIS) $@
	$(LIGHT) $@

