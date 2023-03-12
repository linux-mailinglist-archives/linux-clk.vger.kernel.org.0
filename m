Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B176F6B6849
	for <lists+linux-clk@lfdr.de>; Sun, 12 Mar 2023 17:33:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230308AbjCLQdm (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 12 Mar 2023 12:33:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230294AbjCLQdl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 12 Mar 2023 12:33:41 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60BD332E4F
        for <linux-clk@vger.kernel.org>; Sun, 12 Mar 2023 09:33:39 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id r15so12390009edq.11
        for <linux-clk@vger.kernel.org>; Sun, 12 Mar 2023 09:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678638818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P8n5+2qrlFSzPMdcQf9Zy9rQRjequE82j+1LvxbVRyI=;
        b=HivM776aCmCh4TN6uKFGIiyRgsofDxmNERKkhD8fFx/t/13l3+clEAD4UXi1E9daaa
         AN95eXpTNndJluhfoHiroGUhHc4cHaJ/MjtmMUlzN7YYYA23p4WjNNlsjPtjhQW85R8O
         svt0gOIgiKHSzLtm80w4Aa2uKGq+AxD8DRoEBKTOXOSyHqdCMaLpQ3OFn759AcQfsvyp
         imP8cUWJrSYNxIymLAPzNFQix1zfRoOvHEQ7d8KZohhvtgpQO6HbpzeKtNE51R7VI/Q6
         mWkAEZTanF6OkZh2YZAczL0e9slhCf4l150dNcAiTYowgJmfZRVlStMLMjz6VKZVJ4+D
         j6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678638818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P8n5+2qrlFSzPMdcQf9Zy9rQRjequE82j+1LvxbVRyI=;
        b=qbAWNTLNVD09l+Rb5uTWbOv0AC9m46vNSRUXec6qxYGOIUhgqsuoDwtXjppRViQMHs
         acEihxLGwRfwmfix26D1/LWHbeAk+CYxQt1LPPtR2KNQ38WtOLB59gXTBEp39ev554q2
         oeu5drNA6pobYZUrECZfTR7zwuZV+Nz8LnJDZpOBoncB/WQ0C2D5ff28aSBkmV/pPXkR
         cqF44VYyWX858GMrhF2lun6IDQgmz/ZToJgH55LbaqEdvB9ccQcVwkC26heTj3ZuPpGj
         jjFn204K8DoehrYlbLt/WPZvK1nT5d535uQFqRBgvM+vVCU1zu534wJjoRJ3wHB3Kccn
         XXlw==
X-Gm-Message-State: AO0yUKUKc+yi/BWGc7zV9Y6wgtAVKTa8gtIVwogqN0Vy5d+lJXDwy5R3
        kxRZGOVVwIoqOooM9SLBprgQPA==
X-Google-Smtp-Source: AK7set+u9Gs77e0DEOFa6K6u0PJUCaRg0mREFnBIk7Iu4j2vme204CMwAwDLUfPhpPGPj8kT1QIFfA==
X-Received: by 2002:a17:906:5206:b0:8b1:7fa:6588 with SMTP id g6-20020a170906520600b008b107fa6588mr31057428ejm.12.1678638817911;
        Sun, 12 Mar 2023 09:33:37 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id xc10-20020a170907074a00b0092707833d08sm665254ejb.70.2023.03.12.09.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 09:33:37 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 24/30] clk: samsung: Convert to platform remove callback returning void
Date:   Sun, 12 Mar 2023 17:33:34 +0100
Message-Id: <167863875711.381514.15169199384920504474.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312161512.2715500-25-u.kleine-koenig@pengutronix.de>
References: <20230312161512.2715500-1-u.kleine-koenig@pengutronix.de> <20230312161512.2715500-25-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, 12 Mar 2023 17:15:06 +0100, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> [...]


You mentioned some dependency of v6.3-rc1, so I assume there is no dependency.
There is never a need to mention RC1 dependencies. Maintainer's tree must be
based on it.

Applied, thanks!

[24/30] clk: samsung: Convert to platform remove callback returning void
        https://git.kernel.org/krzk/linux/c/e853fb1803f60da69db82d41d92e30539a859227

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
