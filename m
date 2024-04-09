Return-Path: <linux-clk+bounces-5643-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E36CC89D70A
	for <lists+linux-clk@lfdr.de>; Tue,  9 Apr 2024 12:32:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11B731C2123A
	for <lists+linux-clk@lfdr.de>; Tue,  9 Apr 2024 10:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 118E18287F;
	Tue,  9 Apr 2024 10:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GQdOYDkg"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321DE74297
	for <linux-clk@vger.kernel.org>; Tue,  9 Apr 2024 10:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712658765; cv=none; b=TTMOVMOn6oucLLZVjgEmeSsEEtyM3rGq3YwfSQYO1aC4iuz5Xl0CBeSe+zovaJPyJOwIyCsAdqAsFVupVMAQD2WmenafIDL4uSTHRhu04LepkZrd0ZuSzQnw86tygaa0LpBQVe+mpSfAKbC9K8x+Ci6oAJ0HGY+U5+eV3r8UJyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712658765; c=relaxed/simple;
	bh=5czf5Adh9rovAzlSJfAJI8FiDCtAO2TmwPWLd9haL8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W4Ym/Sd6NOcdMZar9L1dx7EVbnxVTDURvP5qVkm4M+44QvmzXnKELMx8cZR4vjArVtUET4CHv41C9j7pwyeOpkd/EctaidYGMQqfQVywDputD2soTn6mpVjNq6c6tZqTUEnUTKPcMDUML+++lTCVpwBXZiVPauWwdjJZaNN0vMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GQdOYDkg; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-61805d5b1deso20192767b3.0
        for <linux-clk@vger.kernel.org>; Tue, 09 Apr 2024 03:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712658761; x=1713263561; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ywMqPmvjfuSg7K+puQLhP8JMKU69QDDCjZnvVUw25RU=;
        b=GQdOYDkgrep7F5hLpbDGjIbhlfq1Kh2Ql3iVjtZhxuj7Sxo9Sx+Z6Mg/nQ+kgb/mo+
         EEBKlO3HzrpgW53IohoK6WPS0abrSTjrHnY4nNcY/5A7+qseFHZmPHy/97f0pb6yDEKm
         RG/e99UNRWi8YrgKheaE60fxWP/YdQZ/d+qKQFMW9SsA9xw7CWf5sTn+ySonyN6TCMEd
         6YYqB9Qm1qKK9U18x6CHmovcYcEq/tMf2NzB1vAXclbtCuy5WG6ns6xSugrVqYzI8P+J
         ZPJeIdF+b4UZipHoNQIcpXawZ+f2tSlft4qKzXhghCFTySolAcAGu6UYVk8YDtXGxcHT
         JX3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712658761; x=1713263561;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ywMqPmvjfuSg7K+puQLhP8JMKU69QDDCjZnvVUw25RU=;
        b=wf8eSKj6hwvZ9H9MU8Mg0L3Et/682dpzHQgVaQv+M0t7Khl1D0d3bOGTmBgJ155BfV
         2CBH9woi6LLXYRZj/nlQps/yCjZoFY7xpYKREUeJt6z/7X4rnVcjTDJZLyRGv48bAeHe
         Y7bZVb5MP2UXPMEAGtxPp6wPdDF/LjCGZwBZiUn+UIt5mgfBBfP4i2FdNfSSzEmFY8ax
         gHk3xEcIzrIt2JZywwg6D0tjOmPKl19/Pn98O4w8PLa0uwCzPmx9ddE0L9LozDOQETuE
         cYjXOkhkGOzwjqjfF3iBmxnPh766Ijdj3X0FRhMbMHT3BvY0sMnt0owgeU9Av3XBQl2H
         wQXw==
X-Forwarded-Encrypted: i=1; AJvYcCUsCShIEhCfqntdYYV3u5Bt16kPiIiz2Kpw6lxtYjwHLetKV3TGOL/7Gdome861ji7FMZxD03SAaCLC2TaTSv4LfiofHhrecb54
X-Gm-Message-State: AOJu0YxI1nPowPSndRmtduDUKOA7ODcCyEC1AGVJK8+8ihGYDssHE6x9
	uEnRrVnID+yY0L0txj7mcL2qwbU081rDcIFMlQUW1hPxa1urTFCZCUD63GxTaLGYohLkB+T04HX
	N/cg9dtXWYMCk1WqrNfWel7ms9Vi7YXqBwOKbAQ==
X-Google-Smtp-Source: AGHT+IE6ld1LxqfQn0k5e9/PewJ6aOPe+V7Ds69yIjXtT1hudq7zrLPCAyY5v5qOBVfHKUCnvM/mlhNjl+kN+3CdkGA=
X-Received: by 2002:a25:e20b:0:b0:dcd:6c0:da64 with SMTP id
 h11-20020a25e20b000000b00dcd06c0da64mr9426728ybe.58.1712658761139; Tue, 09
 Apr 2024 03:32:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325184204.745706-1-sboyd@kernel.org> <20240325184204.745706-5-sboyd@kernel.org>
 <c1dc0e4c1d4c9ba2b5e9c0fc207db267.sboyd@kernel.org>
In-Reply-To: <c1dc0e4c1d4c9ba2b5e9c0fc207db267.sboyd@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 9 Apr 2024 12:32:04 +0200
Message-ID: <CAPDyKFoGxxSzykQ-=o08LD_P_=8m=KRm4SHK_grBFgXNNv4OVw@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] clk: Get runtime PM before walking tree during disable_unused
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, patches@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Apr 2024 at 04:36, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Stephen Boyd (2024-03-25 11:41:58)
> > Doug reported [1] the following hung task:
> >
> >  INFO: task swapper/0:1 blocked for more than 122 seconds.
> >        Not tainted 5.15.149-21875-gf795ebc40eb8 #1
> >  "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> >  task:swapper/0       state:D stack:    0 pid:    1 ppid:     0 flags:0x00000008
> >  Call trace:
> >   __switch_to+0xf4/0x1f4
> >   __schedule+0x418/0xb80
> >   schedule+0x5c/0x10c
> >   rpm_resume+0xe0/0x52c
> >   rpm_resume+0x178/0x52c
> >   __pm_runtime_resume+0x58/0x98
> >   clk_pm_runtime_get+0x30/0xb0
> >   clk_disable_unused_subtree+0x58/0x208
> >   clk_disable_unused_subtree+0x38/0x208
> >   clk_disable_unused_subtree+0x38/0x208
> >   clk_disable_unused_subtree+0x38/0x208
> >   clk_disable_unused_subtree+0x38/0x208
> >   clk_disable_unused+0x4c/0xe4
> >   do_one_initcall+0xcc/0x2d8
> >   do_initcall_level+0xa4/0x148
> >   do_initcalls+0x5c/0x9c
> >   do_basic_setup+0x24/0x30
> >   kernel_init_freeable+0xec/0x164
> >   kernel_init+0x28/0x120
> >   ret_from_fork+0x10/0x20
> >  INFO: task kworker/u16:0:9 blocked for more than 122 seconds.
> >        Not tainted 5.15.149-21875-gf795ebc40eb8 #1
> >  "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> >  task:kworker/u16:0   state:D stack:    0 pid:    9 ppid:     2 flags:0x00000008
> >  Workqueue: events_unbound deferred_probe_work_func
> >  Call trace:
> >   __switch_to+0xf4/0x1f4
> >   __schedule+0x418/0xb80
> >   schedule+0x5c/0x10c
> >   schedule_preempt_disabled+0x2c/0x48
> >   __mutex_lock+0x238/0x488
> >   __mutex_lock_slowpath+0x1c/0x28
> >   mutex_lock+0x50/0x74
> >   clk_prepare_lock+0x7c/0x9c
> >   clk_core_prepare_lock+0x20/0x44
> >   clk_prepare+0x24/0x30
> >   clk_bulk_prepare+0x40/0xb0
> >   mdss_runtime_resume+0x54/0x1c8
> >   pm_generic_runtime_resume+0x30/0x44
> >   __genpd_runtime_resume+0x68/0x7c
> >   genpd_runtime_resume+0x108/0x1f4
> >   __rpm_callback+0x84/0x144
> >   rpm_callback+0x30/0x88
> >   rpm_resume+0x1f4/0x52c
> >   rpm_resume+0x178/0x52c
> >   __pm_runtime_resume+0x58/0x98
> >   __device_attach+0xe0/0x170
> >   device_initial_probe+0x1c/0x28
> >   bus_probe_device+0x3c/0x9c
> >   device_add+0x644/0x814
> >   mipi_dsi_device_register_full+0xe4/0x170
> >   devm_mipi_dsi_device_register_full+0x28/0x70
> >   ti_sn_bridge_probe+0x1dc/0x2c0
> >   auxiliary_bus_probe+0x4c/0x94
> >   really_probe+0xcc/0x2c8
> >   __driver_probe_device+0xa8/0x130
> >   driver_probe_device+0x48/0x110
> >   __device_attach_driver+0xa4/0xcc
> >   bus_for_each_drv+0x8c/0xd8
> >   __device_attach+0xf8/0x170
> >   device_initial_probe+0x1c/0x28
> >   bus_probe_device+0x3c/0x9c
> >   deferred_probe_work_func+0x9c/0xd8
> >   process_one_work+0x148/0x518
> >   worker_thread+0x138/0x350
> >   kthread+0x138/0x1e0
> >   ret_from_fork+0x10/0x20
> >
> > The first thread is walking the clk tree and calling
> > clk_pm_runtime_get() to power on devices required to read the clk
> > hardware via struct clk_ops::is_enabled(). This thread holds the clk
> > prepare_lock, and is trying to runtime PM resume a device, when it finds
> > that the device is in the process of resuming so the thread schedule()s
> > away waiting for the device to finish resuming before continuing. The
> > second thread is runtime PM resuming the same device, but the runtime
> > resume callback is calling clk_prepare(), trying to grab the
> > prepare_lock waiting on the first thread.
> >
> > This is a classic ABBA deadlock. To properly fix the deadlock, we must
> > never runtime PM resume or suspend a device with the clk prepare_lock
> > held. Actually doing that is near impossible today because the global
> > prepare_lock would have to be dropped in the middle of the tree, the
> > device runtime PM resumed/suspended, and then the prepare_lock grabbed
> > again to ensure consistency of the clk tree topology. If anything
> > changes with the clk tree in the meantime, we've lost and will need to
> > start the operation all over again.
> >
> > Luckily, most of the time we're simply incrementing or decrementing the
> > runtime PM count on an active device, so we don't have the chance to
> > schedule away with the prepare_lock held. Let's fix this immediate
> > problem that can be triggered more easily by simply booting on Qualcomm
> > sc7180.
> >
> > Introduce a list of clk_core structures that have been registered, or
> > are in the process of being registered, that require runtime PM to
> > operate. Iterate this list and call clk_pm_runtime_get() on each of them
> > without holding the prepare_lock during clk_disable_unused(). This way
> > we can be certain that the runtime PM state of the devices will be
> > active and resumed so we can't schedule away while walking the clk tree
> > with the prepare_lock held. Similarly, call clk_pm_runtime_put() without
> > the prepare_lock held to properly drop the runtime PM reference. We
> > remove the calls to clk_pm_runtime_{get,put}() in this path because
> > they're superfluous now that we know the devices are runtime resumed.
> >
> > Reported-by: Douglas Anderson <dianders@chromium.org>
> > Closes: https://lore.kernel.org/all/20220922084322.RFC.2.I375b6b9e0a0a5348962f004beb3dafee6a12dfbb@changeid/ [1]
> > Closes: https://issuetracker.google.com/328070191
> > Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > Cc: Ulf Hansson <ulf.hansson@linaro.org>
> > Cc: Krzysztof Kozlowski <krzk@kernel.org>
> > Fixes: 9a34b45397e5 ("clk: Add support for runtime PM")
> > Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> > ---
>
> Applied to clk-fixes

Apologies for not being able to review this, it got lost in my email
filters. Looks like you manage to solve the locking order for the clk
disable unused thing - great!

However I think the main problem we are seeing with these kind of
locking issues is that we are holding a global lock while calling into
pm_runtime_get|put*(). Similar problems have also been reported in the
past. It's been on my todo list for quite some time to have a closer
look, but I haven't reached it yet.

Without going into too much detail, let me just ask a related
question. Would it not be possible to call pm_runtime_get/put() within
the clock framework, without *always* keeping the clock prepare lock
acquired? I assume a clock can't be unregistered, as long as there is
reference taken for it, right? Wouldn't that be a sufficient guarantee
that it's okay to runtime_resume|suspend its corresponding device?

Or maybe I should just send a patch. :-)

Kind regards
Uffe

