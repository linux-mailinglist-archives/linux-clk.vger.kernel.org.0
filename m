Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 022A9571632
	for <lists+linux-clk@lfdr.de>; Tue, 12 Jul 2022 11:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230482AbiGLJyB (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 12 Jul 2022 05:54:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231877AbiGLJx7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Jul 2022 05:53:59 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99C1821801
        for <linux-clk@vger.kernel.org>; Tue, 12 Jul 2022 02:53:56 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 19so9255291ljz.4
        for <linux-clk@vger.kernel.org>; Tue, 12 Jul 2022 02:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=LMjElaEycr7SAx7h59JBZKxM3vi9DYxeY8Usf5KNPqA=;
        b=M79X/n3YtBxlMJx0CE/v58ek7eJ/4+aNYp72M7tUXpcGUajqpRjpqWDvzIfk0iDKaZ
         RBqy7cwj2XdbTfuZTg2g2RKKDn///7skzfv3cZpPIpd0ma8qBuX6zO/9CcEdT+LGPYp9
         mocZH4KtdzqtbMKmes2DKIjZRmoMQKCICJVEyjM9+tOb/tOTNZIjZmj3nyY0erFmK3Rv
         WQQtDREaTeHmisLSJ2kBHx5avl8u//N3xZyIhfN2v3n0e4N3CZ4uNp3nkSlgf2tOn5b/
         WxkW5FP3vbpO3C2Dx2hgQBqQSsndsCtpbpGvI07V9Sxf/OO2qXrUlfyfFzCEnlikGbgr
         YEZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LMjElaEycr7SAx7h59JBZKxM3vi9DYxeY8Usf5KNPqA=;
        b=KvfqWG+aQtFJaC1OY15SnhDmgJeg9fv/KyHzlSa8phfX1PKEDVEza1Jv7WM08ob6xc
         P+aUEgRKNvwTjRS6x03I4tDcIn1id2wUhTyFFgFWfRxUo+ko8uIwZZr/nP0mzT7Nllbh
         X7VVYGrH2JhHYc2Z44QsdyBbe7t0+kOe6JjXbhV/7oK39Al2J7o+1zcwo3Xx4wCG9T5Z
         yWKhAz2f/4C7f4me1vLw6WfuuL9UB3SrtwCSVtIPlLiHShV6FwO8cYNilOMGOYd9lw2V
         p2YQ3KMIdontyAebvJ8r0/cZLM+m/+eZZDeFKD/nbwIE33NgDYY6Cjl2+f3lTUkMzPT7
         1WUg==
X-Gm-Message-State: AJIora/QpEhl9cFiPBWxOq1JBG7EXLO1TrgXvfUAa7UN8kvUky4dM/dx
        NZ7Z9Q1JoFGHcgZ8jGIDZLIGSg==
X-Google-Smtp-Source: AGRyM1vUyYI89x6KhM9BfxnYOCsnYfp6d4jaPd18IXEKS6Ap6dTYvp3qlHHbxDjKTmb0zSmt5WDAMQ==
X-Received: by 2002:a2e:96c2:0:b0:25d:7b22:f2dc with SMTP id d2-20020a2e96c2000000b0025d7b22f2dcmr1112264ljj.297.1657619634971;
        Tue, 12 Jul 2022 02:53:54 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id z2-20020a19f702000000b004794a78bfe7sm2103304lfe.6.2022.07.12.02.53.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 02:53:54 -0700 (PDT)
Message-ID: <16107992-a69f-9856-aa36-8596c7cdd4ce@linaro.org>
Date:   Tue, 12 Jul 2022 11:53:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v8 04/15] dt-bindings: nvmem: Add fsl,scu-ocotp yaml file
Content-Language: en-US
To:     "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Viorel Suman <viorel.suman@nxp.com>,
        Oliver Graute <oliver.graute@kococonnector.com>,
        Peng Fan <peng.fan@nxp.com>, Liu Ying <victor.liu@nxp.com>,
        Shijie Qin <shijie.qin@nxp.com>, Ming Qian <ming.qian@nxp.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-input@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220707125022.1156498-1-viorel.suman@oss.nxp.com>
 <20220707125022.1156498-5-viorel.suman@oss.nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220707125022.1156498-5-viorel.suman@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 07/07/2022 14:50, Viorel Suman (OSS) wrote:
> From: Abel Vesa <abel.vesa@nxp.com>
> 
> In order to replace the fsl,scu txt file from bindings/arm/freescale,
> we need to split it between the right subsystems. This patch documents
> separately the 'ocotp' child node of the SCU main node.
> 
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> Signed-off-by: Viorel Suman <viorel.suman@nxp.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
