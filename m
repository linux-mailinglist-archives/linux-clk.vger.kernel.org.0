Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C70A76AB3A8
	for <lists+linux-clk@lfdr.de>; Mon,  6 Mar 2023 01:21:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbjCFAVv (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 5 Mar 2023 19:21:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbjCFAVu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 5 Mar 2023 19:21:50 -0500
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2EEFCC02
        for <linux-clk@vger.kernel.org>; Sun,  5 Mar 2023 16:21:47 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-536c2a1cc07so154446967b3.5
        for <linux-clk@vger.kernel.org>; Sun, 05 Mar 2023 16:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cIwIoeOB/kwbnehi/L3e43G0Q5FkI8t0NeQUKQG9Xgs=;
        b=JKvOQ6mAv6pvgUlFVEal8ztFeylFDVRq7ekNJMEzKpKXBDIi+Y1gjz0GQN8LbMaW5i
         As8RYbdSBNDR5RSTFDeqPKQSgDrBp4WCsWSGtNFe0VY97fXlFlQk6vXWb71ItN61Lrty
         V2AKAHTmYpjgM8hK/uFZYbl6gzGWXtEKqJpfK8WNR06YMHp0aYmvRuoANBpqACWbl5uW
         q6AJx8sv2vQXVydkHfIzJGQuedrhnZXoGvy/u3kRY24Fv5fAwDtOFb1PkKxjsfFiPD/N
         9toUwUpvaykzk2vFaBAjCTpXJkys2q+0Dk1u4C271iK2TG2MmD7lPbn09L6M/2o1t6ST
         hkbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cIwIoeOB/kwbnehi/L3e43G0Q5FkI8t0NeQUKQG9Xgs=;
        b=T6uvBoPb11GOlneOfNDE1eNsbjwvFVw9NMgP5UBCYJMNrEvTloMY93MkkT3/4waH++
         fo4wg2mUg8cNUaSFAw4q0jlxCJIAKbtoqvLw3EyCg3+fYFKRQgdLvdoRU9jktRQEp1Eq
         j1TFoDP625y6/5J/91NuXUfVQ65IQOUTTX2ZhcUqydbLPzoq0KqGSjqKHLXC4+cj6DRv
         IxyLATh8gtmbTB86YPLjr0wTIpdRGFtQtCmdl+w52rTfjBfXaAcVZW4j4bRSXP5iN1ZK
         33o41B2OO7IQfSZQQc+QSe7OdR34dnt/eDv3Qg47iE0p5KVWxAF85Nl+VNhvIiPsMQZx
         AM+Q==
X-Gm-Message-State: AO0yUKXRFgzG8UDKCfrfy4N6J5IAK2ll/RupUyJdJ/V0pl4p6Lik1EnK
        0B2SD8NwOVlYzSbXH8I4a+dbl9r5kFaseffK4e1BRHKd7Oxiwx0ZFFU=
X-Google-Smtp-Source: AK7set/rf91xYCdke17B/OtEw1/wGZDAvKJICeLyGYBXBzIySXfpr9elc4A1WrNk8EMthhUIEuvRNcCc5Egb0UNjhCY=
X-Received: by 2002:a81:4318:0:b0:534:7429:2eb4 with SMTP id
 q24-20020a814318000000b0053474292eb4mr5364022ywa.3.1678062106453; Sun, 05 Mar
 2023 16:21:46 -0800 (PST)
MIME-Version: 1.0
References: <20230303-topic-rpmcc_sleep-v1-0-d9cfaf9b27a7@linaro.org> <20230303-topic-rpmcc_sleep-v1-1-d9cfaf9b27a7@linaro.org>
In-Reply-To: <20230303-topic-rpmcc_sleep-v1-1-d9cfaf9b27a7@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 6 Mar 2023 02:21:39 +0200
Message-ID: <CAA8EJpq4tkOKOkaCPwr6nggzJQm3ubRAVgEF1pK38wzmmXizRA@mail.gmail.com>
Subject: Re: [PATCH RFT 01/20] clk: qcom: smd-rpm: Add .is_enabled hook
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, 4 Mar 2023 at 15:27, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> From: Shawn Guo <shawn.guo@linaro.org>
>
> The RPM clock enabling state can be found with 'enabled' in struct
> clk_smd_rpm.  Add .is_enabled hook so that clk_summary in debugfs can
> show a correct enabling state for RPM clocks.

There is a small problem with this patch: now if the bootloader leaves
a clock enabled for some reason and there are no Linux users for that
clock, clk_disable_unused_subtree() will consider this clock disabled
and will not disable the clock on its own.
And at this stage of smd-rpm platforms support I think we better off
finding missing clock consumers rather than depending on the
bootloader for some of the setup.

>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> [Konrad: rebase]
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/clk/qcom/clk-smd-rpm.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index 198886c1b6c8..ecacfbc4a16c 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -424,18 +424,27 @@ static int clk_smd_rpm_enable_scaling(struct qcom_smd_rpm *rpm)
>         return 0;
>  }
>
> +static int clk_smd_rpm_is_enabled(struct clk_hw *hw)
> +{
> +       struct clk_smd_rpm *r = to_clk_smd_rpm(hw);
> +
> +       return r->enabled;
> +}
> +
>  static const struct clk_ops clk_smd_rpm_ops = {
>         .prepare        = clk_smd_rpm_prepare,
>         .unprepare      = clk_smd_rpm_unprepare,
>         .set_rate       = clk_smd_rpm_set_rate,
>         .round_rate     = clk_smd_rpm_round_rate,
>         .recalc_rate    = clk_smd_rpm_recalc_rate,
> +       .is_enabled     = clk_smd_rpm_is_enabled,
>  };
>
>  static const struct clk_ops clk_smd_rpm_branch_ops = {
>         .prepare        = clk_smd_rpm_prepare,
>         .unprepare      = clk_smd_rpm_unprepare,
>         .recalc_rate    = clk_smd_rpm_recalc_rate,
> +       .is_enabled     = clk_smd_rpm_is_enabled,
>  };
>
>  DEFINE_CLK_SMD_RPM_BRANCH_A(bi_tcxo, QCOM_SMD_RPM_MISC_CLK, 0, 19200000);
>
> --
> 2.39.2
>


-- 
With best wishes
Dmitry
