Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81481435E35
	for <lists+linux-clk@lfdr.de>; Thu, 21 Oct 2021 11:47:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231629AbhJUJtW (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 21 Oct 2021 05:49:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231635AbhJUJtV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Oct 2021 05:49:21 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC618C061753
        for <linux-clk@vger.kernel.org>; Thu, 21 Oct 2021 02:47:05 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id r18so102809wrg.6
        for <linux-clk@vger.kernel.org>; Thu, 21 Oct 2021 02:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Xv7yy8py0DKeobvYvlJ9FHOkVAuAh9UvNYK21UpSTh0=;
        b=v//taxIpU61sYw2GgDkdnV/5qgqxhDV68363Q42soNTo+faeEN6SQHRA4Cief4D90P
         E0q62PU7tIxLdwWeNeZn/4QaJi/VxRT1v2nmdWXMwtzGL9S5cotZIL13nKppn2aYoLXC
         GBRrIDSuuEwNxZs4p0kjeaNCwi1Z7W7LAxgAXsQ/gTEA+DYVp2+MCiL/b2x6h6Bgyhtw
         yZyH4uCZq+NWAwpaDdw20xe1D3VKVcGD4ljOxD4eTCXrB51AVGCPpucnZmLWz0KsbWIE
         Si6lSz4FlVlJia8O9OEZ9u0Mzbg7XW5kLRgsF39/aOgDWclsAE7MX74CjDxkV9e2BLtX
         OaTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Xv7yy8py0DKeobvYvlJ9FHOkVAuAh9UvNYK21UpSTh0=;
        b=3I54ZsRdFhBfEhcAz7/JEvwvogC4YylgkNFOu1jTONYMIozGUfc65wDG60e+OJjaHy
         ZjTBpz6gG8ryfTaRak3Tw0wwBsYDUATRZm/diqXyTt69hH0fGZpuRo9+QDuyaeXB56A2
         lHT6AmGtKQgwOwbJIhxDsf/9C+MGb83+PdszC4Xf30rPa/SKq6ps2cevMdVqgT89qsNj
         HfXvwLtFNNS2suBIExu2ddELXY8hLKRRrOFXEwoZxPHwaQVZAapx3aON2dCr1H0MGmeJ
         YuhwtJOEmiQosdCvixcIQCcjNqIZOyILu0u/Cn7mQWDrGUl+1EVr0MUuaBkmDX1AZtV4
         4ZBA==
X-Gm-Message-State: AOAM533AmYwaV3fMU7J5Q0nG84Rj2gg8GJ7SfUwkpgUy/su+pXRrwPM9
        bpcZ3gAyQHiAZf8Nw0886qtXMA==
X-Google-Smtp-Source: ABdhPJyuat/sV/sJFXIOlsrLqS92zPlOzm+T+23hm8J961JAtuxiY3SjW3So5Ni8FNDiFoPoNK+ISg==
X-Received: by 2002:a5d:4643:: with SMTP id j3mr6018858wrs.297.1634809624436;
        Thu, 21 Oct 2021 02:47:04 -0700 (PDT)
Received: from google.com ([95.148.6.207])
        by smtp.gmail.com with ESMTPSA id f186sm7184109wma.46.2021.10.21.02.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 02:47:03 -0700 (PDT)
Date:   Thu, 21 Oct 2021 10:47:01 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 07/10] dt-bindings: mfd: samsung,s2mps11: convert to
 dtschema
Message-ID: <YXE3FSiG87gNtN34@google.com>
References: <20211008113723.134648-1-krzysztof.kozlowski@canonical.com>
 <20211008113931.134847-4-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211008113931.134847-4-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 08 Oct 2021, Krzysztof Kozlowski wrote:

> Convert the MFD part of Samsung S2MPS11/S2MPS13/S2MPS14/S2MPS15/S2MPU02
> family of PMICs to DT schema format.  Previously the bindings were
> mostly in mfd/samsung,sec-core.txt.
> 
> The conversion copies parts of description from existing bindings
> therefore the license is not changed from GPLv2.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/mfd/samsung,s2mps11.yaml         | 267 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 268 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
