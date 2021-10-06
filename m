Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBE35423E89
	for <lists+linux-clk@lfdr.de>; Wed,  6 Oct 2021 15:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231652AbhJFNWB (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 6 Oct 2021 09:22:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231655AbhJFNV7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Oct 2021 09:21:59 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C88B6C061753
        for <linux-clk@vger.kernel.org>; Wed,  6 Oct 2021 06:20:06 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id r7so8728229wrc.10
        for <linux-clk@vger.kernel.org>; Wed, 06 Oct 2021 06:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=p6gdpQMOmptKubvJ742KDDFUbo9hEV0sBfCaJk3WkUE=;
        b=c6QDqpPiXtNIV7dzN5ll+FQ6KvfswcGWcaP2rST+y9EevgjCepx7n6lQ/Ywkm7gsK5
         LHCTTJVgjJrhnLdE5oiKlNUPQ2Kg3yuhCZYBT7PREtbfd0xN0IeZtqeZ8osgZB0JSznl
         12pmuBiPPD7N/XKULR6fiMUPS45M1jy/BcwO+eEAfWGYo/hUdXIbtUSsrr3orlw4p8vn
         UhQoF+aaOVl4fqg5jkQcohYx50IblNjHP1ZqiFMh7vpFYoAWRMyyjDuOzjyu7h2qrEkw
         TX1cslnGgnwvZU5pixPfmoiKDlUjTjehwomD/EOGuzvC+BnGjKNek/TeMsxj1n/BxC76
         Bx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=p6gdpQMOmptKubvJ742KDDFUbo9hEV0sBfCaJk3WkUE=;
        b=akzpNuUrthMoYTSOcAPESDUxEfDuK4ni6Lf/mKkL8e6D14H6RIoLSOvN36dkT0em+j
         WS66PR9ZlIJBcNoAXmVQr1II6vHRQkcbN3/aXkWUNxumf8dj31rrkl4qsKM8J6778KBy
         gNewn1RoDzffn6vAh8Y6VwEyhST6NAJtBwWcDlzxLSa/v91Poe6EmhvMBmtp4PmPPsKt
         m1JjUvZE7rur670OLh1Zhcw4Avtn1WsmA252r1yVOqCDSzANFPAmTqcNrRASNxjITyp2
         7AlMvTcihEg2spryJmDoW7EfdabUlRUTyIJgQrXUMXR7Sy+OFDBQEO+qygg5Gbvl+vlj
         Effg==
X-Gm-Message-State: AOAM531535j2XOCTBm+iX0nVcqmuh6OQHkDQ0ab1mZOIokUkLRoadBZe
        jg6Tu+y4rcWaiz3eNTnSh3KOLw==
X-Google-Smtp-Source: ABdhPJzoqukl/i94XHKcFnleptcwa9ahZaEF/VFUkN64z5eHIVt0qazWn5ydLdseOD3cVrnXwiPuvQ==
X-Received: by 2002:a5d:544c:: with SMTP id w12mr29472633wrv.398.1633526405385;
        Wed, 06 Oct 2021 06:20:05 -0700 (PDT)
Received: from google.com ([95.148.6.175])
        by smtp.gmail.com with ESMTPSA id d16sm5029441wmb.2.2021.10.06.06.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 06:20:04 -0700 (PDT)
Date:   Wed, 6 Oct 2021 14:20:03 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 00/10] regulator/mfd/clock: dt-bindings: Samsung S2M
 and S5M to dtschema
Message-ID: <YV2ig7q0UWQQC5N2@google.com>
References: <20211001094106.52412-1-krzysztof.kozlowski@canonical.com>
 <YVxBuEvHVdyDvaGD@sirena.org.uk>
 <YVxP0+kVxI0xQmQQ@google.com>
 <41226a6d-999d-b1bb-d6a2-294a9e34d271@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <41226a6d-999d-b1bb-d6a2-294a9e34d271@canonical.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 06 Oct 2021, Krzysztof Kozlowski wrote:

> On 05/10/2021 15:14, Lee Jones wrote:
> > On Tue, 05 Oct 2021, Mark Brown wrote:
> > 
> >> On Fri, Oct 01, 2021 at 11:40:56AM +0200, Krzysztof Kozlowski wrote:
> >>
> >>> Merging/dependencies
> >>> ====================
> >>> 1. Regulator related binding changes depend on first two commits (the
> >>>    fixes), because of context.
> >>> 2. The mfd bindings depend on clock and regulator bindings.
> >>>
> >>> The fixes and bindings changes (patches 1-10) should go via the same
> >>> tree.  For example regulator or mfd tree.  I propose the regulator tree,
> >>> since it will have also one driver change (the fix, first commit).
> >>
> >> Lee, Stephen, Michael does Krzysztof's plan make sense to you?
> > 
> > I tend to take cross subsystem patches.  MFD is usually in the centre
> > of these scenarios and I have tooling to easily set-up immutable
> > branches/pull-requests.
> > 
> > Always happy to discuss if others have different/better ideas though.
> > 
> 
> Another alternative is that regulator patches (1-2, 4-6) go via Mark who
> later gives you a stable branch/tag to pull. Then the clock and MFD
> bindings would go on top via MFD tree.

It shouldn't matter where they are first applied.  Creating 2
immutable branches when just 1 will do would be a pain.

> There is a comment from Rob which I will fix in v3.

Sure.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
