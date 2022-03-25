Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48C294E6F0C
	for <lists+linux-clk@lfdr.de>; Fri, 25 Mar 2022 08:40:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354306AbiCYHmB (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 25 Mar 2022 03:42:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236028AbiCYHmA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Mar 2022 03:42:00 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D6569BAC9
        for <linux-clk@vger.kernel.org>; Fri, 25 Mar 2022 00:40:26 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id h10-20020a1c210a000000b0038ccb70e239so18782wmh.3
        for <linux-clk@vger.kernel.org>; Fri, 25 Mar 2022 00:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=dnODPaJY/J+n3BkIXlCmsZJUqQLCC5eiwNXYnqqukBk=;
        b=bqhz2zWMvRkdTQBDj6ZAZIlYrvJPAcKBIWzKZeB+/CBBucdnqvI52PJthfpFSq+v5U
         gXqOV2I/8IDY7tAerS3IsF8S1vXomCZ1TkWfwbcmlpEgxTPxHvU+zVX3G2N0DTAcHLMJ
         xOUOaDwTZW9KOGyD2L0A4rv7QA0/M+fARHBAeMn3SCe/jeZPkLW3Dj3jiq3n+2iluKQE
         cAhJiVZqDkYed4GWxHxsLQw3DW4OsTsw3ovEleJL41j1eDpnGyH2ilSHffmU2sYL02Gm
         xR1hyx4LtKVBwt6pwVXtAWjX8dqRx7hdnRbdg5huBC4C2NnohFwIHSQmBkkuIzhrg8hK
         w5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=dnODPaJY/J+n3BkIXlCmsZJUqQLCC5eiwNXYnqqukBk=;
        b=g4WHx6CzJ5DUjNanaFydioY8w8nkKxH23YGfoBv/FkDAg/tBWkayKk4yAw2LlffED3
         yZLAvwtDrhalE184m+8uG3SA+Mnk1PyRO0yjcgKXBKYQ9esxYwmy8jB8yychmtTsHvcz
         /F19KV1sADHDDwfd7J8yav3Dioip8EmEec/ZGF6WnVz6hf6L+n4m4T4nj/wUV22CzvsA
         f9skJCHUe6/aEgXG77rCHMTnongj7vdSY0MTNcJmXohGqmrlAFBlu5M2GQnVZPUYRkGe
         i5Xu5VSi5luxLQyDnp4b/eNUdHrAOAWPV2T+Nq2/tPMtLVfc/aWqN3KZPKl8cUU/uQq2
         Jtog==
X-Gm-Message-State: AOAM533qtVRs1FTNvFgLry6G22sjcsD5/nQ4qznALsaHQ7aii+iP6TeK
        Hgyg5PQoBETwmDLgyiJbzerOuA==
X-Google-Smtp-Source: ABdhPJx8uYzQeFEFXzUdYuZYNV0f37cM+IUTkBkG2uijMoKDe1z93YfbCiKDAtPpG64eUg9/BDRz/Q==
X-Received: by 2002:a05:600c:34c5:b0:38c:30e3:1e6c with SMTP id d5-20020a05600c34c500b0038c30e31e6cmr18251767wmq.144.1648194024977;
        Fri, 25 Mar 2022 00:40:24 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id q16-20020adfea10000000b00203e0735791sm4407043wrm.39.2022.03.25.00.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Mar 2022 00:40:24 -0700 (PDT)
Date:   Fri, 25 Mar 2022 08:40:22 +0100
From:   LABBE Corentin <clabbe@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     heiko@sntech.de, herbert@gondor.apana.org.au, krzk+dt@kernel.org,
        mturquette@baylibre.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 17/26] clk: rk3399: use proper crypto0 name
Message-ID: <Yj1x5hJEKVL71JZ1@Red>
References: <20220321200739.3572792-1-clabbe@baylibre.com>
 <20220321200739.3572792-18-clabbe@baylibre.com>
 <20220325004125.C80FDC340EC@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220325004125.C80FDC340EC@smtp.kernel.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Le Thu, Mar 24, 2022 at 05:41:23PM -0700, Stephen Boyd a �crit :
> Quoting Corentin Labbe (2022-03-21 13:07:30)
> > rk3399 has 2 crypto instance, reset for crypto1 is correctly named, but
> > crypto0 not.
> > Add a 0 to be consistent.
> 
> This is OK because nothing is using the define today?

Yes, nothing use this rk3399 define.

> 
> > 
> > Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> > ---
> >  include/dt-bindings/clock/rk3399-cru.h | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/include/dt-bindings/clock/rk3399-cru.h b/include/dt-bindings/clock/rk3399-cru.h
> > index 44e0a319f077..39169d94a44e 100644
> > --- a/include/dt-bindings/clock/rk3399-cru.h
> > +++ b/include/dt-bindings/clock/rk3399-cru.h
> > @@ -547,8 +547,8 @@
> >  #define SRST_H_PERILP0                 171
> >  #define SRST_H_PERILP0_NOC             172
> >  #define SRST_ROM                       173
> > -#define SRST_CRYPTO_S                  174
> > -#define SRST_CRYPTO_M                  175
> > +#define SRST_CRYPTO0_S                 174
> > +#define SRST_CRYPTO0_M                 175
> >  
> >  /* cru_softrst_con11 */
> >  #define SRST_P_DCF                     176
> > @@ -556,7 +556,7 @@
> >  #define SRST_CM0S                      178
> >  #define SRST_CM0S_DBG                  179
> >  #define SRST_CM0S_PO                   180
> > -#define SRST_CRYPTO                    181
> > +#define SRST_CRYPTO0                   181
> 
> $ git grep SRST_CRYPTO
> Documentation/devicetree/bindings/crypto/rockchip-crypto.txt:           resets = <&cru SRST_CRYPTO>;
> arch/arm/boot/dts/rk3288.dtsi:          resets = <&cru SRST_CRYPTO>;
> 
> Uh oh. Just don't change it and think about something else when it
> starts to feel inconsistent.

This is on rk3288, so not related to rk3399.
Even on the RK3399 TRM, all crypto clocks are called either crypto0 or crypto1 (neither just crypto)

Regards
