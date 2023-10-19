Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF9E77CFA79
	for <lists+linux-clk@lfdr.de>; Thu, 19 Oct 2023 15:11:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345474AbjJSNLK (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 19 Oct 2023 09:11:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235385AbjJSNLJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Oct 2023 09:11:09 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A651112
        for <linux-clk@vger.kernel.org>; Thu, 19 Oct 2023 06:11:06 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-6ce2add34c8so330014a34.3
        for <linux-clk@vger.kernel.org>; Thu, 19 Oct 2023 06:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697721065; x=1698325865; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jm6DMSO8fMKHAOH/Ts5yTawuQ5qbJzgnz2SgvPmjiJE=;
        b=BB/ERAskv535SK29Cyt2aDn+ySYPGvQFbp+h+u9LxFu/8gF4N1X/xK3KXw4yVlS+Gm
         9mVXBQQecNRr7cmLDiqp0pjz9m2OOz4BaZIiXW9+2SR6uGPmwmBo3xq6zAPOs3pXvFMY
         ACc84rVcih8wFCf02VlgNOu9JpEcAfALwipSV3O8mytmS4fMHj2stlXv7Q2GSW8uAPAQ
         KrXPq0hccZIn5nS/38wW2ZQ2qOcnDog6yzezxvrOXh2UysktarYAGSw5w1Uhyx/4C9yI
         0v+JJYTi/6elWx2YJwXqUxSA9HsUbez+Jpmu25nCy4KzqnaJlp+sYhKXo3XvGpyOMxwe
         Yovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697721065; x=1698325865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jm6DMSO8fMKHAOH/Ts5yTawuQ5qbJzgnz2SgvPmjiJE=;
        b=edN4DQrk5Rh16BM/WIEvaOE0tO354PaZ76/hAbQ/P1XCehoRwwb02Twyg1wpPkEHbg
         DkG7F2Tp8C/W42b1EjgZkJin7B5lcdKMzRfVIl679wvPUHjCXHiJtuzmF7w3Q7YLpaFD
         C9oIFfs9sYA3YpiKNe0dbaAichB9g0fS1klKvDb0mvPrpcEbTEO4jodV+JmQI+l4HXXh
         ULnS2r+UVMHDKS8wrONvjt35EZb+L8HQhA2R9E+VAnxhukDPuuz6MA9f8TRE1IA+qsSV
         +1VmRd75LJNhfBa6U4sXEm6dZxYPy8CACL3I1Ix8khmMs3RU6f3uEhDfj+I7mMVVewSU
         ck5w==
X-Gm-Message-State: AOJu0Yy5yMNP0waZ+obdT1Gk1AwLkloPYQNxzsNNCAYRkKGnRQNlCFmG
        y7zocmAqSWOK9BZk4+xMtUDUPMZmTRNZlMfg4yaOFQ==
X-Google-Smtp-Source: AGHT+IE/jHTUAAR6nIMpfuFVHDcoOayI4LJaNRr2xjsoB7z11oXnUYLoafVN7xD+i6Z21o/jjAiy3LIc6fQpznqcdbw=
X-Received: by 2002:a05:6830:438c:b0:6c0:f451:ab6a with SMTP id
 s12-20020a056830438c00b006c0f451ab6amr2505339otv.8.1697721065336; Thu, 19 Oct
 2023 06:11:05 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-4-peter.griffin@linaro.org> <20231016133649.GA2641997-robh@kernel.org>
In-Reply-To: <20231016133649.GA2641997-robh@kernel.org>
From:   Peter Griffin <peter.griffin@linaro.org>
Date:   Thu, 19 Oct 2023 14:10:54 +0100
Message-ID: <CADrjBPo8xYQtR5qyLPgcUU4VKE9Ecfrb3XGKX4BV8CBLggJE0g@mail.gmail.com>
Subject: Re: [PATCH v3 03/20] dt-bindings: soc: google: exynos-sysreg: add
 dedicated SYSREG compatibles to GS101
To:     Rob Herring <robh@kernel.org>
Cc:     krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
        s.nawrocki@samsung.com, linus.walleij@linaro.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, gregkh@linuxfoundation.org, cw00.choi@samsung.com,
        tudor.ambarus@linaro.org, andre.draszik@linaro.org,
        semen.protsenko@linaro.org, saravanak@google.com,
        willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Rob,

On Mon, 16 Oct 2023 at 14:36, Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Oct 11, 2023 at 07:48:06PM +0100, Peter Griffin wrote:
> > GS101 has three different SYSREG controllers, add dedicated
> > compatibles for them to the documentation.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  .../bindings/soc/samsung/samsung,exynos-sysreg.yaml         | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> > index 163e912e9cad..dbd12a97faad 100644
> > --- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> > +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
> > @@ -30,6 +30,12 @@ properties:
> >                - samsung,exynos5433-fsys-sysreg
> >            - const: samsung,exynos5433-sysreg
> >            - const: syscon
> > +      - items:
> > +          - enum:
> > +              - google,gs101-peric0-sysreg
> > +              - google,gs101-peric1-sysreg
> > +              - google,gs101-apm-sysreg
>
> Alphabetical order.

Will fix

Peter
