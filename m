Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE274CBB6C
	for <lists+linux-clk@lfdr.de>; Thu,  3 Mar 2022 11:32:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232375AbiCCKdE (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 3 Mar 2022 05:33:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232364AbiCCKdD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Mar 2022 05:33:03 -0500
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CE9C179A36
        for <linux-clk@vger.kernel.org>; Thu,  3 Mar 2022 02:32:18 -0800 (PST)
Received: by mail-qk1-x736.google.com with SMTP id bm39so3573970qkb.0
        for <linux-clk@vger.kernel.org>; Thu, 03 Mar 2022 02:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DYNpbzV9XCiofWlx6Ep0BAs5/BGBNmH1zZ8NMWTIAps=;
        b=fy0N6aDWxd9z8c5sVpt36gG3Rrkj9OAzl0zu/lXoo1lw0c1syMnCgctBz3OncmfbM0
         S+KbgdxLrOAslzi7fGCU7byhgjCMGQR7RG9XvsTYyS6S9mo3Pmn5i9NoeIow9KZMM7pD
         +podm37QZ6PoLVvFNEHsflNn+Nima0L7TquXJIHls0EDOZAdHIYcuPCoApohbx97Q73t
         0Mt5gbZAMFDhneLUGctdZaepeKXl8LXljTyfvWA4LdVfOM6+gRKbtNBK8pAFltxGhejI
         /l5FNFKInqlY5w/IhuASsiplMmK9Pj6q801DmJ5kq13IteTd6ayV4ohDbuctWEph8vt8
         BZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DYNpbzV9XCiofWlx6Ep0BAs5/BGBNmH1zZ8NMWTIAps=;
        b=Lr33cprjB7mA5sLJ2KyzvGlU9pvsA6KPV/Oe1gcFcJM9I+UX5gGKmLcR6MlZPvTGWd
         7IYQph2vwbCRuCc7A44BFHA5hT9UViWY4GPks3bJtvFda9SXr6Oya7miAIWPETEJpzUp
         uSOYFoF0IPhaUvfd4SzZz68TW48KQk9tgJSkydhGEFy8Qr5jSiTJt3u68XWq1tGcAjSr
         IsiN758JJKVB7U6VuHnJihbHBsr4mDi5DJ95nvnD+ohY2HBa7YDxhy7CVFM0i7S3z4fh
         /BdObYWohvCacxOlKiupXW99PjPEgrnNiKPRCHjNpaPiNAU7JQWb57kis6dPT/IEcsM+
         97PA==
X-Gm-Message-State: AOAM532/8LNn57voU32nwRFTwPFKA9+Aj42pLSuuP/8tF0whowj1pacv
        jig+nWlfgbdeaVQaoCHIKIdB+VTbnbH3/cjmMJwM6A==
X-Google-Smtp-Source: ABdhPJzq7dQyX57teeUVtaORiHuUIw2463URNE+PzG8vjJ8rLlyi3cWylCaVROZ+17COu1fZbs0dYl5c19KFfc0dSTg=
X-Received: by 2002:a05:620a:4307:b0:507:d5b1:f65e with SMTP id
 u7-20020a05620a430700b00507d5b1f65emr18375993qko.363.1646303537535; Thu, 03
 Mar 2022 02:32:17 -0800 (PST)
MIME-Version: 1.0
References: <20220303082140.240745-1-bhupesh.sharma@linaro.org> <20220303082140.240745-3-bhupesh.sharma@linaro.org>
In-Reply-To: <20220303082140.240745-3-bhupesh.sharma@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 3 Mar 2022 13:32:06 +0300
Message-ID: <CAA8EJpqF5ppEc7-ngvpQifUaGLuvguUS+EKofwwuYe2edOhSbQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sm8150: Add ufs power-domain entries
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, sboyd@kernel.org, tdas@codeaurora.org,
        mturquette@baylibre.com, linux-clk@vger.kernel.org,
        robh+dt@kernel.org, bjorn.andersson@linaro.org,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 3 Mar 2022 at 11:22, Bhupesh Sharma <bhupesh.sharma@linaro.org> wrote:
>
> Add power-domain entries for UFS controller & phy nodes
> in sm8150 dts.
>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index 6012322a5984..7aa879eb24d7 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -1637,6 +1637,8 @@ ufs_mem_hc: ufshc@1d84000 {
>                         phy-names = "ufsphy";
>                         lanes-per-direction = <2>;
>                         #reset-cells = <1>;
> +
> +                       power-domains = <&gcc UFS_PHY_GDSC>;
>                         resets = <&gcc GCC_UFS_PHY_BCR>;
>                         reset-names = "rst";
>
> @@ -1687,6 +1689,9 @@ ufs_mem_phy: phy@1d87000 {
>                         clocks = <&gcc GCC_UFS_MEM_CLKREF_CLK>,
>                                  <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
>
> +                       power-domains = <&gcc UFS_CARD_GDSC>,
> +                                       <&gcc UFS_PHY_GDSC>;
> +                       power-domain-names = "ufs_card_gdsc", "ufs_phy_gdsc";

This will not work, if I'm not mistaken. Platform drivers won't bind
two power-domains by default. And the qmp driver lacks handling for
power domains.

Also a generic question. I see that other platforms use UFS_PHY_GDSC
for the host controller and completely ingore the UFS_CARD_GDSC. What
makes sm8150 so different from the rest of the platforms?

>                         resets = <&ufs_mem_hc 0>;
>                         reset-names = "ufsphy";
>                         status = "disabled";
> --
> 2.35.1
>


-- 
With best wishes
Dmitry
