Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08F9461A2B2
	for <lists+linux-clk@lfdr.de>; Fri,  4 Nov 2022 21:51:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbiKDUv3 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 4 Nov 2022 16:51:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbiKDUv2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Nov 2022 16:51:28 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2957A49B48
        for <linux-clk@vger.kernel.org>; Fri,  4 Nov 2022 13:51:26 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id r12so8957320lfp.1
        for <linux-clk@vger.kernel.org>; Fri, 04 Nov 2022 13:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zMfksGVovJyKssatLq3qPApzW4xAJ9RmshsVA1B1FUM=;
        b=AOyUYLhQB+OF+RwYwdDwwmQ38cHBcpL55GVlYYpbmo/IhTvhxI2JCo4BQLlSpPfIt2
         A7kQpV15ys91B7Xw/oO6H4/94pyD7p5R/9pipaspVrj1YHbAAqWxDnhqCXtufv9IbnSe
         ojKjV/3UgyYxiFjqcvbEBI8RtCfQXB/dzzgWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMfksGVovJyKssatLq3qPApzW4xAJ9RmshsVA1B1FUM=;
        b=IZZe8v4dFQYN+jXQ2nzu81d8wGCrYLpAzN8SzZwdEvX1riaDcocfIQOA3BSwue2Ud1
         J7768fax9gO/f3ZmsqdIiGql8rI8EYZ8goIyru1yB+I7wIWq1bjvNPwYAiUjgL9KaNgZ
         Bp68HtCbzmqeBVLC7uI1h0ksSAbi+Gfn7t00oAi/dvQeMnr/MqNqhduJP3tC8KSkoLUF
         eVdSDVx+8Xxb4ZEiZMeXhKV/ZJjRyM6knkY+yZX2qtycaiJrxp2ip10IuPQPtA3xeTsX
         LfNyPYumMMjEB4HWe5HrImd/K19PwcDS7xnkpNZ91lF3d3INA1x3EuPByEKqVqU4JMCj
         humQ==
X-Gm-Message-State: ACrzQf0Uraq/EMFzwPXETI16aYWB1Ssu9OrXOQYMJOF69949cadVGfGr
        5p6EsyWgvSo/4TvSo7Vn64N7ow/mlP+0/BDS0ZyfHA==
X-Google-Smtp-Source: AMsMyM7Nm8maiYEBKfD/QCN1CZqY5y3LSAqpeCk56cKCFU+2F+w80T1ekhdFysJ1NCnRuWqDWDLO5fNqaZBtILfclho=
X-Received: by 2002:a05:6512:3dac:b0:4a4:8044:9c3 with SMTP id
 k44-20020a0565123dac00b004a4804409c3mr13585880lfv.145.1667595084419; Fri, 04
 Nov 2022 13:51:24 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 4 Nov 2022 13:51:23 -0700
MIME-Version: 1.0
In-Reply-To: <20221104064055.1.I00a0e4564a25489e85328ec41636497775627564@changeid>
References: <20221104064055.1.I00a0e4564a25489e85328ec41636497775627564@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 4 Nov 2022 13:51:23 -0700
Message-ID: <CAE-0n507hS0huoCVoarV65F5cGsxMuYCv-3C4s2e1m61cPMZcg@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: qcom: lpass-sc7280: Fix pm_runtime usage
To:     Bjorn Andersson <andersson@kernel.org>,
        Douglas Anderson <dianders@chromium.org>
Cc:     Taniya Das <quic_tdas@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Douglas Anderson (2022-11-04 06:56:28)
> The pm_runtime usage in lpass-sc7280 was broken in quite a few
> ways. Specifically:
>
> 1. At the end of probe it called "put" twice. This is a no-no and will
>    end us up with a negative usage count. Even worse than calling
>    "put" twice, it never called "get" once. Thus after bootup it could
>    be seen that the runtime usage of the devices managed by this
>    driver was -2.
> 2. In some error cases it manually called pm_runtime_disable() even
>    though it had previously used devm_add_action_or_reset() to set
>    this up to be called automatically. This meant that in these error
>    cases we'd double-call pm_runtime_disable().
> 3. It forgot to call undo pm_runtime_use_autosuspend(), which can
>    sometimes have subtle problems (and the docs specifically mention
>    that you need to undo this function).
>
> Overall the above seriously calls into question how this driver is
> working. It seems like a combination of "it doesn't", "by luck", and
> "because of the weirdness of runtime_pm". Specifically I put a
> printout to the serial console every time the runtime suspend/resume
> was called for the two devices created by this driver (I wrapped the
> pm_clk calls). When I had serial console enabled, I found that the
> calls got resumed at bootup (when the clk core probed and before our
> double-put) and then never touched again. That's no good.
>   [    0.829997] DOUG: my_pm_clk_resume, usage=1
>   [    0.835487] DOUG: my_pm_clk_resume, usage=1
>
> When I disabled serial console (speeding up boot), I got a different
> pattern, which I guess (?) is better:
>   [    0.089767] DOUG: my_pm_clk_resume, usage=1
>   [    0.090507] DOUG: my_pm_clk_resume, usage=1
>   [    0.151885] DOUG: my_pm_clk_suspend, usage=-2
>   [    0.151914] DOUG: my_pm_clk_suspend, usage=-2
>   [    1.825747] DOUG: my_pm_clk_resume, usage=-1
>   [    1.825774] DOUG: my_pm_clk_resume, usage=-1
>   [    1.888269] DOUG: my_pm_clk_suspend, usage=-2
>   [    1.888282] DOUG: my_pm_clk_suspend, usage=-2
>
> These different patterns have to do with the fact that the core PM
> Runtime code really isn't designed to be robust to negative usage
> counts and sometimes may happen to stumble upon a behavior that
> happens to "work". For instance, you can see that
> __pm_runtime_suspend() will treat any non-zero value (including
> negative numbers) as if the device is in use.
>
> In any case, let's fix the driver to be correct. We'll hold a
> pm_runtime reference for the whole probe and then drop it (once!) at
> the end. We'll get rid of manual pm_runtime_disable() calls in the
> error handling. We'll also switch to devm_pm_runtime_enable(), which
> magically handles undoing pm_runtime_use_autosuspend() as of commit
> b4060db9251f ("PM: runtime: Have devm_pm_runtime_enable() handle
> pm_runtime_dont_use_autosuspend()").
>
> While we're at this, let's also use devm_pm_clk_create() instead of
> rolling it ourselves.
>
> Note that the above changes make it obvious that
> lpassaudio_create_pm_clks() was doing more than just creating
> clocks. It was also setting up pm_runtime parameters. Let's rename it.
>
> All of these problems were found by code inspection. I started looking
> at this driver because it was involved in a deadlock that I reported a
> while ago [1]. Though I bisected the deadlock to commit 1b771839de05
> ("clk: qcom: gdsc: enable optional power domain support"), it was
> never really clear why that patch affected it other than a luck of
> timing changes. I'll also note that by fixing the timing (as done in
> this change) we also seem to aboid the deadlock, which is a nice
> benefit.
>
> Also note that some of the fixes here are much the same type of stuff
> that Dmitry did in commit 72cfc73f4663 ("clk: qcom: use
> devm_pm_runtime_enable and devm_pm_clk_create"), but I guess
> lpassaudiocc-sc7280.c didn't exist then.
>
> [1] https://lore.kernel.org/r/20220922154354.2486595-1-dianders@chromium.org
>
> Fixes: a9dd26639d05 ("clk: qcom: lpass: Add support for LPASS clock controller for SC7280")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
