Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB1E9515D7F
	for <lists+linux-clk@lfdr.de>; Sat, 30 Apr 2022 15:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240176AbiD3N26 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 30 Apr 2022 09:28:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240736AbiD3N2x (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 30 Apr 2022 09:28:53 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 534E433882
        for <linux-clk@vger.kernel.org>; Sat, 30 Apr 2022 06:25:29 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-2f7ca2ce255so110256397b3.7
        for <linux-clk@vger.kernel.org>; Sat, 30 Apr 2022 06:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3KdH4A/ZIDn5iuBBsHJpj90JbgUsoauLAn0Cyltu/wo=;
        b=ZAqsmHWcvQoTKbn3/olPYcBsf4oSR7+H6NzpjY2hOfVYJoxtv4I8ztsVWQzD96C5c4
         0e5kjEEJ/skZZk3TCb4aPYieTeX7AX2BkcYpefa/WTKkDcoviN+8kgCTBxTpOyl6cA9/
         +JbZ90+YCM51mBFxlFPPpWIYSGOFxMFkj5k+E3UDy6/4tWQrj1GQZd8j8Gl2xHTijGjy
         G/I6qClpb2aALae2Jdyb+8oGvwEd5/ioLsgHOKub5vaCnwkOiTGfnSrLj+boA1oOrF9Y
         ckiXh3fh1UVFsvZptRpSEC2PcqR12sHLK9rjr3zg0AeDDKYZbVyJgjwQjCVSojSfpcSz
         gPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3KdH4A/ZIDn5iuBBsHJpj90JbgUsoauLAn0Cyltu/wo=;
        b=HIz+fs+mdKGxaJgOIjXB9rQ4PwlRvZSrBJLy3PU/T8nNa0tPK8vNKIMeXNPSKJgcv/
         +9PEihRqWITV/WbUy+BMWEZ0ovpEUGgqVCLpIGFW6FZX8n6gzA5nbaQXdtDa2ifj6fRp
         P1No/DRSpaf1mRzB2FAD8pJVrdhdhwfgo3UdPzWV3GZHPB2NM8XzPRXYvSbAuo6n9cch
         1OA9jhIro75kO2HsukziCOtfgt1AxYMVZ+4+HpDkvySdrVF4bFAsVKTg4TG2GJs8QEDh
         EDBsP+0VmFv7OSrqF3vP3XfUmsTCUimM0dPY9G3PJNbQ18X4oa1RhJcIzl1lrK0cvLdG
         fPjg==
X-Gm-Message-State: AOAM530beUHxhf8cnjLLYyf4uS1Qjzs9DL/n0ZRItnUL2Dfcw/j+3ccI
        zOSOh3huBwaivoTtQWAUkKdjnZ05iJ4wWmM5WwSMvw==
X-Google-Smtp-Source: ABdhPJztvdu1Zcgh8IaCcX/bj94Ep7ne8TT8XdYs5FK9IQt76Wo/NTxuk7LXWJqqFg4WpLwr2xzmYE5xQkeXiBcNWF0=
X-Received: by 2002:a81:1d4e:0:b0:2f7:be8b:502e with SMTP id
 d75-20020a811d4e000000b002f7be8b502emr3980575ywd.278.1651325128489; Sat, 30
 Apr 2022 06:25:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220430054458.31321-1-ansuelsmth@gmail.com> <20220430054458.31321-4-ansuelsmth@gmail.com>
In-Reply-To: <20220430054458.31321-4-ansuelsmth@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 30 Apr 2022 16:25:17 +0300
Message-ID: <CAA8EJpowg9u-U3gTjPOU0ae08TeeXFnGmYNK0Mt8j9UQk2WENw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] clk: qcom: clk-krait: add apq/ipq8064 errata workaround
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sricharan R <sricharan@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
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

On Sat, 30 Apr 2022 at 15:53, Ansuel Smith <ansuelsmth@gmail.com> wrote:
>
> Add apq/ipq8064 errata workaround where the sec_src clock gating needs to
> be disabled during switching. krait-cc compatible is not enough to
> handle this and limit this workaround to apq/ipq8064. We check machine
> compatible to handle this.
>
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/clk/qcom/clk-krait.c | 16 ++++++++++++++++
>  drivers/clk/qcom/clk-krait.h |  1 +
>  drivers/clk/qcom/krait-cc.c  |  8 ++++++++
>  3 files changed, 25 insertions(+)
>
> diff --git a/drivers/clk/qcom/clk-krait.c b/drivers/clk/qcom/clk-krait.c
> index 90046428693c..45da736bd5f4 100644
> --- a/drivers/clk/qcom/clk-krait.c
> +++ b/drivers/clk/qcom/clk-krait.c
> @@ -18,13 +18,23 @@
>  static DEFINE_SPINLOCK(krait_clock_reg_lock);
>
>  #define LPL_SHIFT      8
> +#define SECCLKAGD      BIT(4)
> +
>  static void __krait_mux_set_sel(struct krait_mux_clk *mux, int sel)
>  {
>         unsigned long flags;
>         u32 regval;
>
>         spin_lock_irqsave(&krait_clock_reg_lock, flags);
> +
>         regval = krait_get_l2_indirect_reg(mux->offset);
> +
> +       /* apq/ipq8064 Errata: disable sec_src clock gating during switch. */
> +       if (mux->disable_sec_src_gating) {
> +               regval |= SECCLKAGD;
> +               krait_set_l2_indirect_reg(mux->offset, regval);
> +       }
> +
>         regval &= ~(mux->mask << mux->shift);
>         regval |= (sel & mux->mask) << mux->shift;
>         if (mux->lpl) {
> @@ -33,6 +43,12 @@ static void __krait_mux_set_sel(struct krait_mux_clk *mux, int sel)
>         }
>         krait_set_l2_indirect_reg(mux->offset, regval);
>
> +       /* apq/ipq8064 Errata: re-enabled sec_src clock gating. */
> +       if (mux->disable_sec_src_gating) {
> +               regval &= ~SECCLKAGD;
> +               krait_set_l2_indirect_reg(mux->offset, regval);
> +       }
> +
>         /* Wait for switch to complete. */
>         mb();
>         udelay(1);
> diff --git a/drivers/clk/qcom/clk-krait.h b/drivers/clk/qcom/clk-krait.h
> index 9120bd2f5297..f930538c539e 100644
> --- a/drivers/clk/qcom/clk-krait.h
> +++ b/drivers/clk/qcom/clk-krait.h
> @@ -15,6 +15,7 @@ struct krait_mux_clk {
>         u8              safe_sel;
>         u8              old_index;
>         bool            reparent;
> +       bool            disable_sec_src_gating;
>
>         struct clk_hw   hw;
>         struct notifier_block   clk_nb;
> diff --git a/drivers/clk/qcom/krait-cc.c b/drivers/clk/qcom/krait-cc.c
> index 4d4b657d33c3..cfd961d5cc45 100644
> --- a/drivers/clk/qcom/krait-cc.c
> +++ b/drivers/clk/qcom/krait-cc.c
> @@ -139,6 +139,14 @@ krait_add_sec_mux(struct device *dev, int id, const char *s,
>         mux->hw.init = &init;
>         mux->safe_sel = 0;
>
> +       /* Checking for qcom,krait-cc-v1 or qcom,krait-cc-v2 is not
> +        * enough to limit this to apq/ipq8064. Directly check machine
> +        * compatible to correctly handle this errata.
> +        */
> +       if (of_machine_is_compatible("qcom,ipq8064") ||
> +           of_machine_is_compatible("qcom,apq8064"))
> +               mux->disable_sec_src_gating = true;
> +
>         init.name = kasprintf(GFP_KERNEL, "krait%s_sec_mux", s);
>         if (!init.name)
>                 return -ENOMEM;
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
