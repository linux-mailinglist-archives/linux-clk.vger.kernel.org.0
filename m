Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA16E56554
	for <lists+linux-clk@lfdr.de>; Wed, 26 Jun 2019 11:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbfFZJJG (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 26 Jun 2019 05:09:06 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:33398 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726891AbfFZJJG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Jun 2019 05:09:06 -0400
Received: by mail-io1-f68.google.com with SMTP id u13so3008460iop.0
        for <linux-clk@vger.kernel.org>; Wed, 26 Jun 2019 02:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7dL7h7SkSMLVzpfEmrmJiFGBAxYoaIavJjZPSz0hU7I=;
        b=jbtXscDhjsJEuONxCbh2rlWb09IQnHwk9phiuKReIYqMagEZRqkefxApOqrDgNTjwC
         8cPxCqS0njqZUitqGx7byaBanzWe2tWExVqIf68fiYfH6GgLkeZEwPtnvUm1Lb0sJOQk
         7Whmtox8TN6p53sDlWCs1Oeqo9AMZltPxv5s9W7A8jCwmFqppF8lT+ueiqYTm2ofp54L
         J9pYfCTt5eh2Bbxi/Hb36NchgHNxMaDxlY6CWwQa/LX3TU7ltrsxZOTcb5RPsAUb9y4u
         tX3irBmXchaHy8jhV2/r0EVfAxm5Z2Mk28WUGwx+Qjfvkf7HpEsbuKwE9m+UQeqR9zBN
         MXdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7dL7h7SkSMLVzpfEmrmJiFGBAxYoaIavJjZPSz0hU7I=;
        b=sUH2LgSZ/jUAZJHaqCCG27qSs9IeoCsHE3b1/oNyNgF8DS0AlqDhpVuuYO6CL8Ot47
         boiXr4OIy6Muq5oLGJYTe8wTNUfBEb4TYVjS4vhI/rXeCWN44QzalQwQhfVc6ytQS8kW
         d5aawpD0HG1bX8sp+1EYXupmYMnTkU9Q2YoUsS68rL009wlSZZKYNdGHOD6l3cl5iyqF
         7z/YyCCeXkuX1psrRBht9EpSs+6xwAqHn8pD6xl/GmmhVe0x4JPwb82229K+yj4adylJ
         u33yE6IYcw4RAF8wcvaCe4JqPkM5Do/prhzUtHU1O/Iba+w1Y0V1ChB0hbPsogQc5YY8
         Pdlg==
X-Gm-Message-State: APjAAAWg61K7VLK4awQn3fvUQw0uzKAkb0F1DL0rLMxb2XMF7EHH42oq
        rpEypCqNZ1uYN/NGS5GvTbm937xorf9Usd1YU+JWKg==
X-Google-Smtp-Source: APXvYqyfAj3+7X5HQdYqxWCVc+aScPFHv4kHJEc2n+zGiaWOgxDOOyizFKHvtKMZ7FZ6f9dIyrSzDbudAT6xWVQ+DOM=
X-Received: by 2002:a5d:8252:: with SMTP id n18mr2740479ioo.230.1561540145441;
 Wed, 26 Jun 2019 02:09:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org> <20190625164733.11091-14-jorge.ramirez-ortiz@linaro.org>
In-Reply-To: <20190625164733.11091-14-jorge.ramirez-ortiz@linaro.org>
From:   Niklas Cassel <niklas.cassel@linaro.org>
Date:   Wed, 26 Jun 2019 11:08:54 +0200
Message-ID: <CAHYWTt37Q1E_bggbKb8VdcHRj_YYubqaoVHNN7+1kcr8+XMX0g@mail.gmail.com>
Subject: Re: [PATCH v3 13/14] arm64: dts: qcom: qcs404: Add DVFS support
To:     Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Brown <david.brown@linaro.org>, jassisinghbrar@gmail.com,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Will Deacon <will.deacon@arm.com>, arnd@arndb.de,
        horms+renesas@verge.net.au, heiko@sntech.de,
        Sibi Sankar <sibis@codeaurora.org>,
        enric.balletbo@collabora.com,
        Jagan Teki <jagan@amarulasolutions.com>, olof@lixom.net,
        Vinod Koul <vkoul@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Khasim Syed Mohammed <khasim.mohammed@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

I actually think that it makes sense to squash this patch with the
[PATCH v3 10/14] arm64: dts: qcom: qcs404: Add OPP table
patch.

But that might be a personal preference.

Either way, I think this series in ready for the real mailing list.




On Tue, 25 Jun 2019 at 18:48, Jorge Ramirez-Ortiz
<jorge.ramirez-ortiz@linaro.org> wrote:
>
> Support dynamic voltage and frequency scaling on qcs404.
>
> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qcs404.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> index 9569686dbc41..4b4ce0b5df76 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> @@ -34,6 +34,9 @@
>                         enable-method = "psci";
>                         cpu-idle-states = <&CPU_SLEEP_0>;
>                         next-level-cache = <&L2_0>;
> +                       clocks = <&apcs_glb>;
> +                       operating-points-v2 = <&cpu_opp_table>;
> +                       cpu-supply = <&pms405_s3>;
>                 };
>
>                 CPU1: cpu@101 {
> @@ -43,6 +46,9 @@
>                         enable-method = "psci";
>                         cpu-idle-states = <&CPU_SLEEP_0>;
>                         next-level-cache = <&L2_0>;
> +                       clocks = <&apcs_glb>;
> +                       operating-points-v2 = <&cpu_opp_table>;
> +                       cpu-supply = <&pms405_s3>;
>                 };
>
>                 CPU2: cpu@102 {
> @@ -52,6 +58,9 @@
>                         enable-method = "psci";
>                         cpu-idle-states = <&CPU_SLEEP_0>;
>                         next-level-cache = <&L2_0>;
> +                       clocks = <&apcs_glb>;
> +                       operating-points-v2 = <&cpu_opp_table>;
> +                       cpu-supply = <&pms405_s3>;
>                 };
>
>                 CPU3: cpu@103 {
> @@ -61,6 +70,9 @@
>                         enable-method = "psci";
>                         cpu-idle-states = <&CPU_SLEEP_0>;
>                         next-level-cache = <&L2_0>;
> +                       clocks = <&apcs_glb>;
> +                       operating-points-v2 = <&cpu_opp_table>;
> +                       cpu-supply = <&pms405_s3>;
>                 };
>
>                 L2_0: l2-cache {
> --
> 2.21.0
>
