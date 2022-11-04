Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D70E61A2AF
	for <lists+linux-clk@lfdr.de>; Fri,  4 Nov 2022 21:51:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbiKDUvO (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 4 Nov 2022 16:51:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbiKDUvN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Nov 2022 16:51:13 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7D851FCE7
        for <linux-clk@vger.kernel.org>; Fri,  4 Nov 2022 13:51:11 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id i21so9304459edj.10
        for <linux-clk@vger.kernel.org>; Fri, 04 Nov 2022 13:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=osyiUzHDpQ2b7ih/B+DgltcTg6y80KjFxz7EsgKKi4k=;
        b=YHDfqHF4z+DLMhHV4CIqYlVbRtpF9Vs/WjejXbkhUiKi/IQcczSWnxwRNQX4LgT0di
         M4ZFAikpqI/fsBcexazarbcUqV1JjnQWjf0CEbAgFfIzAuZkJ2HducuGb+kOHaOx43eI
         /q++/gU/xAYb8SGp8zgqkw1p7EYf9/+thgO3lH3Ih4++TUOau92f9Hx9XewRnpN7cuAK
         oXqdI/c/1DfXOS0roxj3aj7Gz/J8Op1YvBCiVjDuvF+h4FFH6gizUPvgzWCzki/aQk2Z
         X+L8MCHqqKy5P5zVPCQuMsuZ85Y7pKzHY+PzLfL0A7POzyYJH56cABoe+NBOwbDAs9eh
         Jlzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=osyiUzHDpQ2b7ih/B+DgltcTg6y80KjFxz7EsgKKi4k=;
        b=YQc3+pAjHMY/I9AgyQf68t9TJ8FKb71vVZ3rFhvqotf7QNYkJ43R9g9Un+Xg/t2HFN
         nJYM0szMJgliJRDfl3q9JxGitn90/LdxBzbPyeaTDtPct42oJPd1RJ+CO0zFI68Bzzzs
         kLZHhAWDRAbH7pvd9KEYeaOZzRwKI6PdjH4D03zY1OJW5rlp/DQyFT59Oo7rQjyhQL1w
         2eRHiHLLGcQAUFk+GwudZA5Ie1DRqyoen/DN6i1IVTlAqPtkR1fjPW27QAE0wi1EYsto
         tFcp9GJupNIHs6MIJ7vPB8hDUb+8A460tz/PrVPol9hom+FVDriegXCU5skWV3vRuxGl
         0u/Q==
X-Gm-Message-State: ACrzQf1jpDjHe9MS3NJ9RZinLhUcXByfZvk2FhHYhRRIB42t7C4bo1XJ
        W570nTw+2mkKjtG7Qcl7HgQMQw==
X-Google-Smtp-Source: AMsMyM7oXSJ3C4Rzx58L+qgDsaXMmR+B8N6HJBu02Ly92IqAOEQ3JFm5GqTGo9NNMe35JCj5VsIuow==
X-Received: by 2002:a05:6402:1004:b0:464:778:c516 with SMTP id c4-20020a056402100400b004640778c516mr15586249edu.348.1667595070485;
        Fri, 04 Nov 2022 13:51:10 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id v3-20020aa7d803000000b004585eba4baesm213243edq.80.2022.11.04.13.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 13:51:09 -0700 (PDT)
Date:   Fri, 4 Nov 2022 22:51:08 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Peng Fan <peng.fan@oss.nxp.com>
Cc:     abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 0/6] clk: imx93: fix and update
Message-ID: <Y2V7PPGtzFgTxI89@linaro.org>
References: <20221028095211.2598312-1-peng.fan@oss.nxp.com>
 <b7be4912-542e-8fdc-6948-ac4626a63418@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7be4912-542e-8fdc-6948-ac4626a63418@oss.nxp.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-11-02 10:13:45, Peng Fan wrote:
> Hi Abel, Stephen
> 
> On 10/28/2022 5:52 PM, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> > 
> > V2:
> >   Update commit log for patch 3
> >   Add comment for critial clock for patch 5,6
> 
> V2 was not added to patch subject when I send out this patchset.
> If you need to repost with V2, please let me know.

Sorry for the late reply.

No need to resend.

> 
> Thanks,
> Peng.
> 
> > 
> > patch 1 is reported by Dan and marked as fix
> > 
> > During our development, per updated reference mannual and design
> > information, correct enet and drop tpm 1/3, lpit 1/2.
> > 
> > The TPM/LPIT patch 3,4 are not marked as fixes, there is no user,
> > so update binding and driver both.
> > 
> > Patch 5 enable HSIO root always on
> > Patch 6 enable sysctr always on for cpuidle
> > 
> > Jacky Bai (2):
> >    clk: imx: keep hsio bus clock always on
> >    clk: imx93: keep sys ctr clock always on
> > 
> > Peng Fan (4):
> >    clk: imx93: unmap anatop base in error handling path
> >    clk: imx93: correct enet clock
> >    dt-bindings: clock: imx93: drop TPM1/3 LPIT1/2 entry
> >    clk: imx93: drop tpm1/3, lpit1/2 clk
> > 
> >   drivers/clk/imx/clk-imx93.c             | 38 ++++++++++++++-----------
> >   include/dt-bindings/clock/imx93-clock.h |  4 ---
> >   2 files changed, 21 insertions(+), 21 deletions(-)
> > 
