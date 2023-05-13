Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B1CA701969
	for <lists+linux-clk@lfdr.de>; Sat, 13 May 2023 20:50:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234000AbjEMSuZ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 13 May 2023 14:50:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230317AbjEMSuY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 13 May 2023 14:50:24 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6590CB4
        for <linux-clk@vger.kernel.org>; Sat, 13 May 2023 11:50:22 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-50bd37ca954so99396808a12.0
        for <linux-clk@vger.kernel.org>; Sat, 13 May 2023 11:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684003821; x=1686595821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MPztQ4ysSm8CI2wA0uE15k28FITvSfHGliPiFsdgAxY=;
        b=GFxiA3x12RZw7/KFiB77zyI6i+oO28ferVOUkRzQBkN2czSkTeEvp2OJUxcKqgygC9
         tMuOl07beoP9i7edYYURBQA6Z7mSpDas1PqwdL+c8OTLko/Oqp0KzbOojmnGS41A8qZA
         FB1ZzddNAANqCzbqWrbobWl6e/ZxYnJvNCs4PHqK0KfEQEod2mDkUSVAiZOIPXsc8K/h
         OWa+G84b/9leETthM4DJWkc8zL9DerqpLS5pxD6p6OFVfWp0YiqyX/Z/9VoS1lZNY3/P
         b1+OrHISjkBWx3X1ywYgpYOlmJWPCAJ12Z5Tw2QAJIejozSUaVF8qXVhpmScHYfWdg9w
         h9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684003821; x=1686595821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MPztQ4ysSm8CI2wA0uE15k28FITvSfHGliPiFsdgAxY=;
        b=aQe+FOi6PLfoRk0qxeHpGkU54ERcbY5uy2vkc1pI6b7d2Ew4siYTyV9HibICEmL6+W
         Wsg1z4PdAVYlfI+c2nQWDPFiud5D2V4Yox4SNs661oGuW9yXqpCvJiXWwbmPPDHwVN8C
         vV6LizEnjrnb16U4xWArJ/oTX5b4gVQUXhSgT0VBqza3ZLKSeAfRqVpf4HWE7IpHfv3s
         oS0WKvMs8bGXdjCj07pO3ZDBj4aCNF6cBcWxoxx2O7Vkybm9G5yItwGebKjq/usjnZYt
         nrJxCe8PwzJyJoYmIP7X3bULD1zaoyVnskWM+f7CXnrPlQFKRcse1QrAifW1aAbioE2c
         k3UA==
X-Gm-Message-State: AC+VfDxtXWM8OynVNcbx4z/8k5Y2KUAspJ7wQBJ0uxa1XvDvmBbG81nB
        3Rdw0hxeA13GC7K5dp1+2YqbfA==
X-Google-Smtp-Source: ACHHUZ7cM/4sDDsWPTlMqC7K237m8lTf25p1JBv3zCY6hwb7iFthgLMbZuJHxqnpO7F/CzUvjQexCg==
X-Received: by 2002:a17:906:5d13:b0:960:6263:138f with SMTP id g19-20020a1709065d1300b009606263138fmr27091674ejt.27.1684003820858;
        Sat, 13 May 2023 11:50:20 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:ba68:e5c9:694e:c6e4])
        by smtp.gmail.com with ESMTPSA id n12-20020a1709065dac00b009663cf5dc2fsm7122023ejv.66.2023.05.13.11.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 May 2023 11:50:20 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 7/7] arm64: dts: exynos: Remove clock from Exynos850 pmu_system_controller
Date:   Sat, 13 May 2023 20:50:18 +0200
Message-Id: <168400381592.12030.10842902628648015143.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230308233822.31180-8-semen.protsenko@linaro.org>
References: <20230308233822.31180-1-semen.protsenko@linaro.org> <20230308233822.31180-8-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Wed, 08 Mar 2023 17:38:22 -0600, Sam Protsenko wrote:
> As described in the corresponding binding documentation for
> "samsung,exynos850-pmu", the "clocks" property should be used for
> specifying CLKOUT mux inputs. Therefore, the clock provided to exynos850
> pmu_system_controller is incorrect and should be removed. Instead of
> making syscon regmap keep that clock running for PMU accesses, it should
> be made always running in the clock driver, because the kernel is not
> the only software accessing PMU registers on Exynos850 platform.
> 
> [...]

Applied, thanks!

[7/7] arm64: dts: exynos: Remove clock from Exynos850 pmu_system_controller
      https://git.kernel.org/krzk/linux/c/858fd147234dbb66401bc102968a479f92e7ad43

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
