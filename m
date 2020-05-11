Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53A241CD032
	for <lists+linux-clk@lfdr.de>; Mon, 11 May 2020 05:13:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbgEKDM6 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 10 May 2020 23:12:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725830AbgEKDM5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 10 May 2020 23:12:57 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F3FDC061A0C
        for <linux-clk@vger.kernel.org>; Sun, 10 May 2020 20:12:57 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id a5so4686151vsm.7
        for <linux-clk@vger.kernel.org>; Sun, 10 May 2020 20:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wD8LqIUSTHmx07hI69udebSQ//EWpWh/2EL/wbwVZVM=;
        b=bPTKb6Hz4T1T3ZIBaNsHbJBY9spZ48z9FK9D5PFgSOZexloi5nfRV+frjMiQMJV9AF
         6d870yDSK2GjuOrwf+qwOBo55lxBv5CqM/EgvHI2Nkkuu4poM6dcqNuJG7a4/BI8Ceta
         731NMxceOt18AoWB4W9iMCluvqfH80mLyLOQ4SI1vGxKv1xER+z2AHF/U+0xTvEavBO6
         2Rd7SbkX3joAt6sAkZAJ2wg2/HEQPim3ELhF5kYPDa/gv7Va2sSNn7JBM9vdZYpj9uCx
         F0OWjXNRoaDixUUJBw5Joa4twv9Wco/qvZO9IePBkON9Pk1CHX0AIijACMH1NYU+lPAB
         1kOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wD8LqIUSTHmx07hI69udebSQ//EWpWh/2EL/wbwVZVM=;
        b=EOQcSE6+LxB40R6V4p1C7r2JHxr4y7TUdbgH8A7uFPyTpg4qOkYfAcGrW+rziuxPpT
         c7PYuw71Vg2PfIFUIa0T22Mg4m6UjJRP1zgGBlshlwMnNu0oUrsHwXMpS6CKSG8K5T4w
         sSZDJ4JH282PtVL+IX6B4aqy4Kx0Nke6x8dNrxSMDu9XJ1oUqQ6bXD74mKtqD791VLFL
         ZitH4whwwOHelNMZESzTgv7I9Smr2UreoJPrWZLlgPnoODMZAEKzJ6F6qdcxamk/EAaC
         eoM/nEHfjKySJiAKss6peL5t8vtSOl2T7zaWpJJ+ijEDGhrD1ZHAQy5dxLDIDWAWaL6Y
         syMA==
X-Gm-Message-State: AGi0Pub12WH01Ewn9vJbWYNvYAoF9eqPw4XKmO+umozIuhtrOFXPdhMW
        fN/cpntn9UutIShKL7+QbexY5TE0UxUFbaxLrF9TMA==
X-Google-Smtp-Source: APiQypJP1/nLwbTc/RZGN8unEAO0lP5H7D7NY0XZUzlVAayGsxKwX4kpz0BpS7Iing2tP0GZhbCubV15JmcaQAzsUDI=
X-Received: by 2002:a67:407:: with SMTP id 7mr9030175vse.95.1589166776348;
 Sun, 10 May 2020 20:12:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
 <20200427072342.5499-1-jian-hong@endlessm.com> <20200428162152.ztsqp7nxqbwqrm6r@gilmour.lan>
 <CAPpJ_efvtVzb_hvoVOeaePh7UdE13wOiiGaDBH38cToB-yhkUg@mail.gmail.com>
 <20200507172158.cybtakpo6cxv6wcs@gilmour.lan> <CAPpJ_efxenmSXt2OXkhkQ1jDJ59tyWBDUvmpyOB-bfPMDENQZg@mail.gmail.com>
In-Reply-To: <CAPpJ_efxenmSXt2OXkhkQ1jDJ59tyWBDUvmpyOB-bfPMDENQZg@mail.gmail.com>
From:   Jian-Hong Pan <jian-hong@endlessm.com>
Date:   Mon, 11 May 2020 11:12:05 +0800
Message-ID: <CAPpJ_ed9TMJjN8xS1_3saf5obQhULJSLNgQSAFxgiWM2QX9A7Q@mail.gmail.com>
Subject: Re: [PATCH v2 00/91] drm/vc4: Support BCM2711 Display Pipelin
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Eric Anholt <eric@anholt.net>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-rpi-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Linux Upstreaming Team <linux@endlessm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Jian-Hong Pan <jian-hong@endlessm.com> =E6=96=BC 2020=E5=B9=B45=E6=9C=888=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=882:20=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Maxime Ripard <maxime@cerno.tech> =E6=96=BC 2020=E5=B9=B45=E6=9C=888=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=881:22=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > On Mon, May 04, 2020 at 02:35:08PM +0800, Jian-Hong Pan wrote:
> > > Maxime Ripard <maxime@cerno.tech> =E6=96=BC 2020=E5=B9=B44=E6=9C=8829=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=8812:21=E5=AF=AB=E9=81=93=EF=
=BC=9A
> > > >
> > > > Hi,
> > > >
> > > > On Mon, Apr 27, 2020 at 03:23:42PM +0800, Jian-Hong Pan wrote:
> > > > > Hi Maxime,
> > > > >
> > > > > Thanks for your V2 patch series!  I'm testing it.
> > > > >
> > > > > This patch series is applied upon mainline kernel 5.7-rc2 cleanly=
 and built.
> > > > > System can boot into console text mode, but no graphic UI.
> > > > >
> > > > > Get the error in vc5_hdmi_phy_init(), and full dmesg is at [1]:
> > > > >
> > > > > [    5.587543] vc4_hdmi fef00700.hdmi: Unknown register ID 46
> > > > > [    5.587700] debugfs: Directory 'fef00700.hdmi' with parent 'vc=
4-hdmi' already present!
> > > > > [    5.588070] vc4_hdmi fef00700.hdmi: vc4-hdmi-hifi <-> fef00700=
.hdmi mapping ok
> > > > > [    5.588076] vc4_hdmi fef00700.hdmi: ASoC: no DMI vendor name!
> > > > > [    5.588263] vc4-drm gpu: bound fef00700.hdmi (ops vc4_hdmi_ops=
)
> > > > > [    5.588299] vc4_hdmi fef05700.hdmi: Unknown register ID 46
> > > > > [    5.588373] debugfs: Directory 'vc4-hdmi' with parent 'asoc' a=
lready present!
> > > > > [    5.588673] vc4_hdmi fef05700.hdmi: vc4-hdmi-hifi <-> fef05700=
.hdmi mapping ok
> > > > > [    5.588677] vc4_hdmi fef05700.hdmi: ASoC: no DMI vendor name!
> > > > > [    5.588809] vc4-drm gpu: bound fef05700.hdmi (ops vc4_hdmi_ops=
)
> > > > > [    5.588854] vc4-drm gpu: bound fe806000.vec (ops vc4_vec_ops)
> > > > > [    5.588897] vc4-drm gpu: bound fe004000.txp (ops vc4_txp_ops)
> > > > > [    5.588934] vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops)
> > > > > [    5.588990] vc4-drm gpu: bound fe206000.pixelvalve (ops vc4_cr=
tc_ops)
> > > > > [    5.589030] vc4-drm gpu: bound fe207000.pixelvalve (ops vc4_cr=
tc_ops)
> > > > > [    5.589074] vc4-drm gpu: bound fe20a000.pixelvalve (ops vc4_cr=
tc_ops)
> > > > > [    5.589106] vc4-drm gpu: bound fe216000.pixelvalve (ops vc4_cr=
tc_ops)
> > > > > [    5.589145] vc4-drm gpu: bound fec12000.pixelvalve (ops vc4_cr=
tc_ops)
> > > > > [    5.589294] checking generic (3e513000 6d8c00) vs hw (0 ffffff=
ffffffffff)
> > > > > [    5.589297] fb0: switching to vc4drmfb from simple
> > > > > [    5.589433] Console: switching to colour dummy device 80x25
> > > > > [    5.589481] [drm] Supports vblank timestamp caching Rev 2 (21.=
10.2013).
> > > > > [    5.589816] [drm] Initialized vc4 0.0.0 20140616 for gpu on mi=
nor 0
> > > > > [    5.601079] ------------[ cut here ]------------
> > > > > [    5.601095] WARNING: CPU: 2 PID: 127 at drivers/gpu/drm/vc4/vc=
4_hdmi_phy.c:413 vc5_hdmi_phy_init+0x7ac/0x2078
> > > > > [    5.601097] Modules linked in:
> > > > > [    5.601103] CPU: 2 PID: 127 Comm: kworker/2:1 Not tainted 5.7.=
0-rc2-00091-ga181df59a930 #7
> > > > > [    5.601105] Hardware name: Raspberry Pi 4 Model B (DT)
> > > > > [    5.601112] Workqueue: events deferred_probe_work_func
> > > > > [    5.601116] pstate: 20000005 (nzCv daif -PAN -UAO)
> > > > > [    5.601119] pc : vc5_hdmi_phy_init+0x7ac/0x2078
> > > > > [    5.601123] lr : vc4_hdmi_encoder_enable+0x1b8/0x1ac0
> > > > > [    5.601124] sp : ffff80001217b410
> > > > > [    5.601126] x29: ffff80001217b410 x28: ffff0000ec6370f0
> > > > > [    5.601129] x27: ffff0000f650d400 x26: 000000008a500000
> > > > > [    5.601132] x25: ffff8000113b4ac0 x24: 0000000000002060
> > > > > [    5.601135] x23: 000000000a500000 x22: 0000000000000300
> > > > > [    5.601137] x21: 0000000008d9ee20 x20: ffff0000ec535080
> > > > > [    5.601140] x19: 000000010989e7c0 x18: 0000000000000000
> > > > > [    5.601142] x17: 0000000000000001 x16: 0000000000005207
> > > > > [    5.601145] x15: 00004932ad293c92 x14: 0000000000000137
> > > > > [    5.601147] x13: ffff800010015000 x12: 0000000000000001
> > > > > [    5.601150] x11: 0000000000000001 x10: 0000000000000000
> > > > > [    5.601152] x9 : 0000000000000000 x8 : ffff800010015038
> > > > > [    5.601154] x7 : 0000000000000001 x6 : ffff80001217b368
> > > > > [    5.601157] x5 : 0000000000000000 x4 : 000000000000004c
> > > > > [    5.601159] x3 : 0000000000000000 x2 : ffff8000113b4ac0
> > > > > [    5.601162] x1 : ffff8000120c5f44 x0 : 00000000dc8984ff
> > > > > [    5.601164] Call trace:
> > > > > [    5.601169]  vc5_hdmi_phy_init+0x7ac/0x2078
> > > > > [    5.601172]  vc4_hdmi_encoder_enable+0x1b8/0x1ac0
> > > > > [    5.601176]  drm_atomic_helper_commit_modeset_enables+0x224/0x=
248
> > > > > [    5.601179]  vc4_atomic_complete_commit+0x400/0x558
> > > > > [    5.601182]  vc4_atomic_commit+0x1e0/0x200
> > > > > [    5.601185]  drm_atomic_commit+0x4c/0x60
> > > > > [    5.601190]  drm_client_modeset_commit_atomic.isra.0+0x17c/0x2=
38
> > > > > [    5.601192]  drm_client_modeset_commit_locked+0x5c/0x198
> > > > > [    5.601195]  drm_client_modeset_commit+0x30/0x58
> > > > > [    5.601201]  drm_fb_helper_restore_fbdev_mode_unlocked+0x78/0x=
e0
> > > > > [    5.601204]  drm_fb_helper_set_par+0x30/0x68
> > > > > [    5.601208]  fbcon_init+0x3d4/0x598
> > > > > [    5.601212]  visual_init+0xb0/0x108
> > > > > [    5.601214]  do_bind_con_driver+0x1d0/0x3a8
> > > > > [    5.601217]  do_take_over_console+0x144/0x208
> > > > > [    5.601219]  do_fbcon_takeover+0x68/0xd8
> > > > > [    5.601222]  fbcon_fb_registered+0x100/0x118
> > > > > [    5.601226]  register_framebuffer+0x1f4/0x338
> > > > > [    5.601229]  __drm_fb_helper_initial_config_and_unlock+0x2f8/0=
x4a0
> > > > > [    5.601232]  drm_fbdev_client_hotplug+0xd4/0x1b0
> > > > > [    5.601235]  drm_fbdev_generic_setup+0xb0/0x130
> > > > > [    5.601238]  vc4_drm_bind+0x184/0x1a0
> > > > > [    5.601241]  try_to_bring_up_master+0x168/0x1c8
> > > > > [    5.601244]  __component_add+0xa4/0x170
> > > > > [    5.601246]  component_add+0x14/0x20
> > > > > [    5.601248]  vc4_vec_dev_probe+0x20/0x30
> > > > > [    5.601252]  platform_drv_probe+0x54/0xa8
> > > > > [    5.601254]  really_probe+0xd8/0x320
> > > > > [    5.601256]  driver_probe_device+0x58/0xf0
> > > > > [    5.601258]  __device_attach_driver+0x84/0xc8
> > > > > [    5.601263]  bus_for_each_drv+0x78/0xc8
> > > > > [    5.601265]  __device_attach+0xe4/0x140
> > > > > [    5.601267]  device_initial_probe+0x14/0x20
> > > > > [    5.601269]  bus_probe_device+0x9c/0xa8
> > > > > [    5.601271]  deferred_probe_work_func+0x74/0xb0
> > > > > [    5.601276]  process_one_work+0x1bc/0x338
> > > > > [    5.601279]  worker_thread+0x1f8/0x428
> > > > > [    5.601282]  kthread+0x138/0x158
> > > > > [    5.601286]  ret_from_fork+0x10/0x1c
> > > > > [    5.601288] ---[ end trace cfba0996218c3f3d ]---
> > > >
> > > > Thanks for testing!
> > > >
> > > > Do you have a bit more details regarding your setup? Was it connect=
ed to an
> > > > external display?
> > >
> > > Yes, the HDMI cable is connected to HDMI0 port on RPi 4.
> > >
> > > > If so, do you know the resolution it was trying to setup?
> > >
> > > According to the log, I think it is 1920x1080:
> > > Apr 27 15:37:25 endless gdm-Xorg-:0[1960]: (II) modeset(0): Output
> > > HDMI-1 connected
> > > Apr 27 15:37:25 endless gdm-Xorg-:0[1960]: (II) modeset(0): Output
> > > HDMI-2 disconnected
> > > Apr 27 15:37:25 endless gdm-Xorg-:0[1960]: (II) modeset(0): Output
> > > Composite-1 disconnected
> > > Apr 27 15:37:25 endless gdm-Xorg-:0[1960]: (II) modeset(0): Using
> > > exact sizes for initial modes
> > > Apr 27 15:37:25 endless gdm-Xorg-:0[1960]: (II) modeset(0): Output
> > > HDMI-1 using initial mode 1920x1080 +0+0
> > >
> > > https://gist.github.com/starnight/45e1468bfa0426a54d2fb4a9269cfb94
> >
> > It looks to be fairly standard then, and I'm testing on the same resolu=
tion so
> > it should be alright.
> >
> > Given from your log, it looks like you're running as arm64 though, whil=
e I stuck
> > with arm32, so it could be the explanation.
>
> Yes, I build it as arm64.
>
> > Can you share your config.txt and .config so that I can try to reproduc=
e it
> > here?
>
> Here is the config
> https://gist.github.com/starnight/320b757441b6769c36160704b401c98b

Here is the only one line in config.txt:
enable_uart=3D1

Actually, we make the Raspberry Pi's firmware bring up U-Boot, then
U-Boot boots kernel.

Jian-Hong Pan
