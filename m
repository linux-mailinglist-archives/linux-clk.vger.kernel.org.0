Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0DD59D20B
	for <lists+linux-clk@lfdr.de>; Tue, 23 Aug 2022 09:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241010AbiHWH0n (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 23 Aug 2022 03:26:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240938AbiHWH0f (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 Aug 2022 03:26:35 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7E5662AAB
        for <linux-clk@vger.kernel.org>; Tue, 23 Aug 2022 00:26:25 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id u24so7113928lji.0
        for <linux-clk@vger.kernel.org>; Tue, 23 Aug 2022 00:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=pj6xTpwe5jCa7gf4oXD6M9oiUHNi8rnsbEhqbBzZF7A=;
        b=M6mMvzw3eP2I2SMrN7kMfa0C4FXHVeNHys2MAiT0NClLI6jqMNfxyGw08itI6MQwDq
         BL4v+oeUtiqsnPjq+mz6AbP3HFr+59sfREctWhQtiCncNwu/q0cEGBXrSfC7a1NP9kDE
         QN4up8SJ5/VGmuWWqXqjY43Krr3i17IPIlbTerqoXhjlcZCNu+u56qXevJgKxqdGb84J
         Ie5QTOqwe9CZxngwE9sr4mmXK8aFbOZmMhGN52hdIn30k4h2QSneCMpE0eIASe20ppT+
         qDHEcUXTVKeC8fZNxAhGom63LfJpbc72J/be2lxgnPTbf7g14fTuBkmU1C2WsUbhYb3X
         zoig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=pj6xTpwe5jCa7gf4oXD6M9oiUHNi8rnsbEhqbBzZF7A=;
        b=eLAWIwB60jWL9elf//naTnmvcFsUTx9S5aq4wJI6sp78UL9fHMDus5K8qT4y6LnrRz
         +iI7t3qjxB2Q2AnZQt1lZVluUFd6RXCujP1+UgIUSiczjcEBGY0gU+S0aeW+jF7k5f/8
         mbTyM41vv9AmsACeYmfRyjYtOqnwy0KcJF+xjcN7IPddJ+OjHTJQlOLeQqgPgKRe2+gE
         WAfLYvzDM6LRUjYkdFeCvFMnYESe9WJIPqOruq34NgEhvNRuwmOR90Bsc5vDJPpM8yNu
         pC4+EH9e6GktRBNgKNHY04jQyci3cXZg09ZiaePuYOs8bkBd3XZS2OHhePMFK40qdAy2
         Fnhw==
X-Gm-Message-State: ACgBeo3QkmbfvsYwUFr/bgdhkfIfSvreit2SKzUj3G7Iq91O7JRwRXa8
        6sWP5kX3JGe6V1zONtv/vHrsxw==
X-Google-Smtp-Source: AA6agR7fbniKlw6G1lwCSbS33udM+UcDsk2B3y1+wqaKwzycAHbSOBkYmG0XcfRVsa87EdBgBOAFeg==
X-Received: by 2002:a05:651c:b29:b0:261:d351:9dc4 with SMTP id b41-20020a05651c0b2900b00261d3519dc4mr1515050ljr.409.1661239584153;
        Tue, 23 Aug 2022 00:26:24 -0700 (PDT)
Received: from krzk-bin.. (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id i24-20020a196d18000000b0047f8e9826a1sm2357410lfc.31.2022.08.23.00.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 00:26:23 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     robh+dt@kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        semen.protsenko@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        virag.david003@gmail.com, linux-samsung-soc@vger.kernel.org,
        sumit.semwal@linaro.org, devicetree@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        chanho61.park@samsung.com, linux-arm-kernel@lists.infradead.org,
        m.szyprowski@samsung.com, Tomasz Figa <tomasz.figa@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 0/9] exynos850: Add cmu and sysmmu nodes
Date:   Tue, 23 Aug 2022 10:26:16 +0300
Message-Id: <166123956380.357728.13209226645448018903.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220809113323.29965-1-semen.protsenko@linaro.org>
References: <20220809113323.29965-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 9 Aug 2022 14:33:14 +0300, Sam Protsenko wrote:
> Now that the basic SysMMU v7 support is ready [1,2], all SysMMU nodes
> can be added to Exynos850 SoC device tree. This series includes next
> changes:
> 
>   1. Add all missing clock domains needed for SysMMU clocks
>   2. Add corresponding CMU nodes in device tree
>   3. Add all SysMMU nodes in device tree
> 
> [...]

Applied, thanks!

[1/9] dt-bindings: clock: Add bindings for Exynos850 CMU_AUD
      https://git.kernel.org/krzk/linux/c/45bbf4d76a6730acf63805798d6fe7a126e49dbc
[2/9] dt-bindings: clock: Add bindings for Exynos850 CMU_IS
      https://git.kernel.org/krzk/linux/c/f20f35f46f1a65e1c4b65d8fb62acdbdafd11e1e
[3/9] dt-bindings: clock: Add bindings for Exynos850 CMU_MFCMSCL
      https://git.kernel.org/krzk/linux/c/8f3fc0ed70b97e7544ec1a57c60fe6b2f2f778c3
[4/9] clk: samsung: exynos850: Style fixes
      https://git.kernel.org/krzk/linux/c/dbaa27cc7e62d87d46014ef314811eb00fad9bda
[5/9] clk: samsung: exynos850: Implement CMU_AUD domain
      https://git.kernel.org/krzk/linux/c/b73fd95def4fd9cde548ed17be19f845349e1c0c
[6/9] clk: samsung: exynos850: Implement CMU_IS domain
      https://git.kernel.org/krzk/linux/c/bf3a4c519ca5455d96de2b9a8b1467f536bc0679
[7/9] clk: samsung: exynos850: Implement CMU_MFCMSCL domain
      https://git.kernel.org/krzk/linux/c/7f36d3b696aebb624fb50cd2e852bba289521604
[8/9] arm64: dts: exynos: Add CMU_AUD, CMU_IS and CMU_MFCMSCL for Exynos850
      https://git.kernel.org/krzk/linux/c/2c8cf49c7dec4b5f7323588279aa9e8a4174ebf9
[9/9] arm64: dts: exynos: Add SysMMU nodes for Exynos850
      https://git.kernel.org/krzk/linux/c/09a122384e34a4aa7ebae59c1eb11d69cd80658c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
