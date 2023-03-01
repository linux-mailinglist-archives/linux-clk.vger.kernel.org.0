Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42EEC6A7471
	for <lists+linux-clk@lfdr.de>; Wed,  1 Mar 2023 20:47:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbjCATrv (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 1 Mar 2023 14:47:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjCATru (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Mar 2023 14:47:50 -0500
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 653BB48E02;
        Wed,  1 Mar 2023 11:47:49 -0800 (PST)
Received: by mail-oi1-f180.google.com with SMTP id s41so10939777oiw.13;
        Wed, 01 Mar 2023 11:47:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bp2PGCxGuMgOJ8cORfOtpk4XODU0Ny1bCo8g3l2fvo0=;
        b=S5rb3DVU/VXoJwTqwBMK1g7eRW3svqC88b0eHpg8BTK21Z69LlqYggk29aw+su4ok7
         HTgYyThnP0vza9QhLtljc28m1LwUDh25jc+/utGof24PJ8PcppqlvyCtDUbP6CgK4o/M
         DE9/nbpB2WxRrQQ142FZwR2Ln2SOc2DZX+qgaUxnsTJyWCz4DGUKkeSTP6HX1RGgXDC6
         /ewKdMHKpTbQRM07qSEjU3p1+sGVQip7LPCy9yFkx8uyord4APa8AcHtWyvbpAHL57CX
         pv+n17RXQj01WAncwL75OFw/CXUOwBqtE2G8ppuokPa2XXjrhz8Ykr5xIfIoY6+/wjCt
         B5Ag==
X-Gm-Message-State: AO0yUKU2YIQN/KRsl63lHDwZk5Gdgj1OqdThZITbrzLmPP+Tv4u37A8A
        tMnDsSA6XaX0m77kqWv83w==
X-Google-Smtp-Source: AK7set//WZpJLFD2TfIqVNwVy65QznG09dAJ6oEmCVH3aAhJpxFT6+d2dZsCAvYjXd/LCdpVVdQm9g==
X-Received: by 2002:a05:6808:8d:b0:384:4621:a3e7 with SMTP id s13-20020a056808008d00b003844621a3e7mr3949011oic.38.1677700067221;
        Wed, 01 Mar 2023 11:47:47 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:80e4:92a3:b465:3c5a:901b:f4f7])
        by smtp.gmail.com with ESMTPSA id i5-20020acaea05000000b00383b8084203sm6173577oih.26.2023.03.01.11.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 11:47:46 -0800 (PST)
Received: (nullmailer pid 9115 invoked by uid 1000);
        Wed, 01 Mar 2023 19:47:42 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc:     rockosov@gmail.com, mturquette@baylibre.com,
        martin.blumenstingl@googlemail.com, linux-clk@vger.kernel.org,
        linux-amlogic@lists.infradead.org, jbrunet@baylibre.com,
        kernel@sberdevices.ru, khilman@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        neil.armstrong@linaro.org, linux-kernel@vger.kernel.org,
        jian.hu@amlogic.com
In-Reply-To: <20230301183759.16163-4-ddrokosov@sberdevices.ru>
References: <20230301183759.16163-1-ddrokosov@sberdevices.ru>
 <20230301183759.16163-4-ddrokosov@sberdevices.ru>
Message-Id: <167769997208.7087.5344356236212731922.robh@kernel.org>
Subject: Re: [PATCH v9 3/5] dt-bindings: clock: meson: add A1 PLL clock
 controller bindings
Date:   Wed, 01 Mar 2023 13:47:42 -0600
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Wed, 01 Mar 2023 21:37:57 +0300, Dmitry Rokosov wrote:
> Add the documentation for Amlogic A1 PLL clock driver, and A1 PLL
> clock controller bindings.
> Also include new A1 clock controller dt bindings to MAINTAINERS.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> ---
>  .../bindings/clock/amlogic,a1-pll-clkc.yaml   | 59 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  include/dt-bindings/clock/a1-pll-clkc.h       | 20 +++++++
>  3 files changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/a1-pll-clkc.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.example.dts:18:18: fatal error: dt-bindings/clock/a1-clkc.h: No such file or directory
   18 |         #include <dt-bindings/clock/a1-clkc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:434: Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1508: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230301183759.16163-4-ddrokosov@sberdevices.ru

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

