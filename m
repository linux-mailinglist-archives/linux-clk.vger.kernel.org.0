Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 930356172B4
	for <lists+linux-clk@lfdr.de>; Thu,  3 Nov 2022 00:35:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231374AbiKBXf0 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 2 Nov 2022 19:35:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231337AbiKBXfG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Nov 2022 19:35:06 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D709B22BEB
        for <linux-clk@vger.kernel.org>; Wed,  2 Nov 2022 16:27:30 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id d26so1035768eje.10
        for <linux-clk@vger.kernel.org>; Wed, 02 Nov 2022 16:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q4q9wfgcOclGdcMsl14RDjUCS9gfVlvxYztXFkY+AAE=;
        b=eJKjIYfM3SW+G0n7AWqNkgTG0ba9Cy4iuR3meDnaeJvCu+4iV0UX3p5UwsRF6E1JJt
         0vaJfVWpOgcBq2tnz00/mptxQk1uEIp+Qav50UiemxUjAGIOdzccOSqr1E06efrPYwgu
         jHgQYYJB23zJDJX9hy1vb+BrWY9PhA3YOQf/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q4q9wfgcOclGdcMsl14RDjUCS9gfVlvxYztXFkY+AAE=;
        b=giVfSndClO5OkBHzvGW8+D1I/IJCPOis6myEPmpTrxw0sJBHBW79p9r+Wv4ZXtgm/8
         5wEFCn/5CvDNUokYRy5ya38CpZ/y+IAyzqjXent9lEGa9kiYcu3CTzu145B2DjnxQzyZ
         eHlto+ATbPTeJzAfbxFt6Ut8uyK8rQ6SKnG3oncFJ+kvcmd/RYt5veoF2ipWqlX5jnKo
         5sir+igHMzvQY03nXIf7Qs1elN0IcgL9nFZ5lJBqJYHbyS/4R2big+80lS4vyf0aDZQ1
         wb41A4t4VabKoGwfUDtKASrkuCacFvD+0ZIdVxqI0if3XepRPtk+bI0yFA/1TLfgbiNA
         5qsw==
X-Gm-Message-State: ACrzQf3zcklR6MO7zxDiuUVRvZ/AJr1jaj7H1mt7Kzig6WN/JvohY2PZ
        UbA3cRc2lez+C+jFouUI7JH+H6DoxBIRdAho
X-Google-Smtp-Source: AMsMyM5UoK5AjCb8ZOxBjxTn+fy/JRkreRKZuUAw+2I2nOghnLsIGXSSFwQ3CrGO5/ZvlCFrLLtYpQ==
X-Received: by 2002:a17:907:761b:b0:7a3:86dd:d330 with SMTP id jx27-20020a170907761b00b007a386ddd330mr25766598ejc.34.1667431600240;
        Wed, 02 Nov 2022 16:26:40 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id d25-20020aa7c1d9000000b00456c6b4b777sm6300157edp.69.2022.11.02.16.26.37
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 16:26:38 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id g12so359619wrs.10
        for <linux-clk@vger.kernel.org>; Wed, 02 Nov 2022 16:26:37 -0700 (PDT)
X-Received: by 2002:a5d:51cb:0:b0:236:6a62:4bc8 with SMTP id
 n11-20020a5d51cb000000b002366a624bc8mr16755550wrv.583.1667431597355; Wed, 02
 Nov 2022 16:26:37 -0700 (PDT)
MIME-Version: 1.0
References: <20221102170717.1262547-1-swboyd@chromium.org>
In-Reply-To: <20221102170717.1262547-1-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 2 Nov 2022 16:26:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xb5h=Su+t32c5m8DDvWG5mt7MP9XRxoBmJjF=ePLhtUw@mail.gmail.com>
Message-ID: <CAD=FV=Xb5h=Su+t32c5m8DDvWG5mt7MP9XRxoBmJjF=ePLhtUw@mail.gmail.com>
Subject: Re: [PATCH v2] clk: qcom: gdsc: Remove direct runtime PM calls
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, patches@lists.linux.dev,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Wed, Nov 2, 2022 at 10:07 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> We shouldn't be calling runtime PM APIs from within the genpd
> enable/disable path for a couple reasons.
>
> First, this causes an AA lockdep splat because genpd can call into genpd
> code again while holding the genpd lock.
>
> WARNING: possible recursive locking detected
> 5.19.0-rc2-lockdep+ #7 Not tainted
> --------------------------------------------
> kworker/2:1/49 is trying to acquire lock:
> ffffffeea0370788 (&genpd->mlock){+.+.}-{3:3}, at: genpd_lock_mtx+0x24/0x30
>
> but task is already holding lock:
> ffffffeea03710a8 (&genpd->mlock){+.+.}-{3:3}, at: genpd_lock_mtx+0x24/0x30
>
> other info that might help us debug this:
>  Possible unsafe locking scenario:
>
>        CPU0
>        ----
>   lock(&genpd->mlock);
>   lock(&genpd->mlock);
>
>  *** DEADLOCK ***
>
>  May be due to missing lock nesting notation
>
> 3 locks held by kworker/2:1/49:
>  #0: 74ffff80811a5748 ((wq_completion)pm){+.+.}-{0:0}, at: process_one_work+0x320/0x5fc
>  #1: ffffffc008537cf8 ((work_completion)(&genpd->power_off_work)){+.+.}-{0:0}, at: process_one_work+0x354/0x5fc
>  #2: ffffffeea03710a8 (&genpd->mlock){+.+.}-{3:3}, at: genpd_lock_mtx+0x24/0x30
>
> stack backtrace:
> CPU: 2 PID: 49 Comm: kworker/2:1 Not tainted 5.19.0-rc2-lockdep+ #7
> Hardware name: Google Lazor (rev3 - 8) with KB Backlight (DT)
> Workqueue: pm genpd_power_off_work_fn
> Call trace:
>  dump_backtrace+0x1a0/0x200
>  show_stack+0x24/0x30
>  dump_stack_lvl+0x7c/0xa0
>  dump_stack+0x18/0x44
>  __lock_acquire+0xb38/0x3634
>  lock_acquire+0x180/0x2d4
>  __mutex_lock_common+0x118/0xe30
>  mutex_lock_nested+0x70/0x7c
>  genpd_lock_mtx+0x24/0x30
>  genpd_runtime_suspend+0x2f0/0x414
>  __rpm_callback+0xdc/0x1b8
>  rpm_callback+0x4c/0xcc
>  rpm_suspend+0x21c/0x5f0
>  rpm_idle+0x17c/0x1e0
>  __pm_runtime_idle+0x78/0xcc
>  gdsc_disable+0x24c/0x26c
>  _genpd_power_off+0xd4/0x1c4
>  genpd_power_off+0x2d8/0x41c
>  genpd_power_off_work_fn+0x60/0x94
>  process_one_work+0x398/0x5fc
>  worker_thread+0x42c/0x6c4
>  kthread+0x194/0x1b4
>  ret_from_fork+0x10/0x20
>
> Second, this confuses runtime PM on CoachZ for the camera devices by
> causing the camera clock controller's runtime PM usage_count to go
> negative after resuming from suspend. This is because runtime PM is
> being used on the clock controller while runtime PM is disabled for the
> device.
>
> The reason for the negative count is because a GDSC is represented as a
> genpd and each genpd that is attached to a device is resumed during the
> noirq phase of system wide suspend/resume (see the noirq suspend ops
> assignment in pm_genpd_init() for more details). The camera GDSCs are
> attached to camera devices with the 'power-domains' property in DT.
> Every device has runtime PM disabled in the late system suspend phase
> via __device_suspend_late(). Runtime PM is not usable until runtime PM
> is enabled in device_resume_early(). The noirq phases run after the
> 'late' and before the 'early' phase of suspend/resume. When the genpds
> are resumed in genpd_resume_noirq(), we call down into gdsc_enable()
> that calls pm_runtime_resume_and_get() and that returns -EACCES to
> indicate failure to resume because runtime PM is disabled for all
> devices.
>
> Upon closer inspection, calling runtime PM APIs like this in the GDSC
> driver doesn't make sense. It was intended to make sure the GDSC for the
> clock controller providing other GDSCs was enabled, specifically the
> MMCX GDSC for the display clk controller on SM8250 (sm8250-dispcc), so
> that GDSC register accesses succeeded. That will already happen because
> we make the 'dev->pm_domain' a parent domain of each GDSC we register in
> gdsc_register() via pm_genpd_add_subdomain(). When any of these GDSCs
> are accessed, we'll enable the parent domain (in this specific case
> MMCX).
>
> We also remove any getting of runtime PM during registration, because
> when a genpd is registered it increments the count on the parent if the
> genpd itself is already enabled. And finally, the runtime PM state of
> the clk controller registering the GDSC shouldn't matter to the
> subdomain setup. Therefore we always assign 'dev' unconditionally so
> when GDSCs are removed we properly unlink the GDSC from the clk
> controller's pm_domain.
>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Johan Hovold <johan+linaro@kernel.org>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Taniya Das <quic_tdas@quicinc.com>
> Cc: Satya Priya <quic_c_skakit@quicinc.com>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Matthias Kaehlcke <mka@chromium.org>
> Reported-by: Stephen Boyd <swboyd@chromium.org>
> Fixes: 1b771839de05 ("clk: qcom: gdsc: enable optional power domain support")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>
> Changes from v1 (https://lore.kernel.org/r/20221101233421.997149-1-swboyd@chromium.org):
>  * Fix ret thinko
>  * Update kerneldoc on 'dev' member
>
>  drivers/clk/qcom/gdsc.c | 62 +++++------------------------------------
>  drivers/clk/qcom/gdsc.h |  2 +-
>  2 files changed, 8 insertions(+), 56 deletions(-)

Though I'm not an expert, this seems reasonable to me and certainly an
improvement in that it no longer calls pm_runtime calls during the
"noirq" resume phase. Thus a non-expert:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

This also seems to avoid the problems I reported [1]. Even though the
root cause (pm_runtime vs. clk prepare lock deadlock) is still
theoretically possible at least the problem is no longer tickled for
me (I tested on a sc7280-herobrine-villager board). Thus, I'm OK with:

Tested-by: Douglas Anderson <dianders@chromium.org>

[1] https://lore.kernel.org/r/20220922154354.2486595-1-dianders@chromium.org
