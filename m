Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D61E7A07CA
	for <lists+linux-clk@lfdr.de>; Thu, 14 Sep 2023 16:48:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240737AbjINOsp (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 14 Sep 2023 10:48:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240566AbjINOs2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Sep 2023 10:48:28 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FE0D2118
        for <linux-clk@vger.kernel.org>; Thu, 14 Sep 2023 07:48:24 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-d7b91422da8so1071271276.2
        for <linux-clk@vger.kernel.org>; Thu, 14 Sep 2023 07:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694702904; x=1695307704; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HuHnnCCpKec3KupkEaXCUwSfceD3r5v9lcKHYT+1ctU=;
        b=uwOzEaRMlvkrX6eBWpjTmYYq/BIp35aWULXxX2pVTtglET3jtjxkAVOfYdwt22wd7J
         pSGO7CeMaYRPidkO4KLxPl2tkhCI+pAFOs3tq+i4l4eSCJUnXbwD/zJNwoAxdBcVNsT1
         yLPx5eGtt5WLnq4uOXEZiF5JAyCWPgrH3ns8qg4llIB6S4qSBK4HfSVVSn0k0614reaS
         7XFG6H7hlO/rwk1Itq+cm7NhauRK5bfd1r0Ed03QLTNs9b9CYic0vQ4ZxHutkLnFF7YR
         JX55qt8AGcP1IZLlKKbAK22Nq2SI9U8J1Cz7yOyD61xKh3qDgJyhueuNzA9SC44kuQcf
         T4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694702904; x=1695307704;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HuHnnCCpKec3KupkEaXCUwSfceD3r5v9lcKHYT+1ctU=;
        b=Sbg95ByBbB+YzsHgxCf5zj9Hi78AJQWxgxWnxGgCyuhFWXQoBwv+gjkZlmQlCbhm8Y
         Lqb2RDM3WBlgu5JXb3zPn8XL5n4WpWdSay3tjaszbgG9h4Q0ljlqaF8IjUZlwkwVcITW
         eYLWav6+lym8OP91XdBstOpQzLY14DX3AN4QjzdP0x3HTy2+PgxCWc57XNoLRF54oSL2
         u6PCFqcz/ARtf9cmCIkbRsOzwbkk7mlaSgVSVQuQy50cRWShqRJMVsh7esYHOavsAwGh
         NpTJ3qYyjpAdkZTvvVAOZVFjSA3VzgproT2SJL+EjBxv9K0oHPPqgHuj3/SRB7Vnyn5d
         TUEQ==
X-Gm-Message-State: AOJu0YyRvx17bAJ+rS3iydDoDZ7z8bGaEHIy57YOhFYBaAaPPAq2cRQm
        7eUXdnwVRtI9nWvfFgIrJGKBC/KT7ulaqTbn5z1nUw==
X-Google-Smtp-Source: AGHT+IGBWbsPXdVUyVGh6IoeKWogXMpeV+NV1QYCzoeda8qrpQjFBedRitaOXAtVUrf1hzUWZSmx3vAdawl5AXo2Qt4=
X-Received: by 2002:a25:858b:0:b0:d4c:cbd2:f6f3 with SMTP id
 x11-20020a25858b000000b00d4ccbd2f6f3mr5416147ybk.53.1694702903830; Thu, 14
 Sep 2023 07:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230912045157.177966-1-claudiu.beznea.uj@bp.renesas.com> <20230912045157.177966-32-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20230912045157.177966-32-claudiu.beznea.uj@bp.renesas.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 14 Sep 2023 16:47:48 +0200
Message-ID: <CAPDyKFq1n=QOt9WSnzH4juPZ-B7xWdwGnDcAYUo7_D=2PRj-WQ@mail.gmail.com>
Subject: Re: [PATCH 31/37] dt-bindings: mmc: renesas,sdhi: Document RZ/G3S support
To:     Claudiu <claudiu.beznea@tuxon.dev>
Cc:     geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linus.walleij@linaro.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org,
        magnus.damm@gmail.com, catalin.marinas@arm.com, will@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        biju.das.jz@bp.renesas.com, quic_bjorande@quicinc.com,
        arnd@arndb.de, konrad.dybcio@linaro.org, neil.armstrong@linaro.org,
        nfraprado@collabora.com, rafal@milecki.pl,
        wsa+renesas@sang-engineering.com,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 12 Sept 2023 at 06:53, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Document support for the SD Card/MMC interface on the Renesas
> RZ/G3S (R9A08G045) SoC.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> index 7756a8687eaf..94e228787630 100644
> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> @@ -59,6 +59,7 @@ properties:
>                - renesas,sdhi-r9a07g043 # RZ/G2UL
>                - renesas,sdhi-r9a07g044 # RZ/G2{L,LC}
>                - renesas,sdhi-r9a07g054 # RZ/V2L
> +              - renesas,sdhi-r9a08g045 # RZ/G3S
>                - renesas,sdhi-r9a09g011 # RZ/V2M
>            - const: renesas,rcar-gen3-sdhi # R-Car Gen3 or RZ/G2
>        - items:
> @@ -122,6 +123,7 @@ allOf:
>                - renesas,sdhi-r9a07g043
>                - renesas,sdhi-r9a07g044
>                - renesas,sdhi-r9a07g054
> +              - renesas,sdhi-r9a08g045
>                - renesas,sdhi-r9a09g011
>      then:
>        properties:
> --
> 2.39.2
>
