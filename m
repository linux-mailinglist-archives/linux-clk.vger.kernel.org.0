Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 175FD6AC3CF
	for <lists+linux-clk@lfdr.de>; Mon,  6 Mar 2023 15:49:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230338AbjCFOtl (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 6 Mar 2023 09:49:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230506AbjCFOtk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Mar 2023 09:49:40 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 119B22ED79
        for <linux-clk@vger.kernel.org>; Mon,  6 Mar 2023 06:49:18 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id u9so39715282edd.2
        for <linux-clk@vger.kernel.org>; Mon, 06 Mar 2023 06:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678114155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFVOxxJWmcBBAsxjQVvaTc6NhO3PyYN3/IVM+H/3TK8=;
        b=mCym/pE56yl4VukDNNE4rO0NjAXcvF2OTUAhc4snUaI+4AP/j2l03QrlYqvvI6QSNJ
         p1BeqQ0alynnVREfBRWWNArPfkxOZcV1P0nuKd4QFJh2Zp4qm2Rk65d0R/bbLl1hF41f
         n+3JDWK4OOPzaeSFNogvFnC9ZCto7j4lMiF3LuhUwwtxjFbaefROGZcPvxkkT2R3vZbm
         xnZ6DTN4UmkiGB9MMI45EIYUe/j1IYSMUP9vajnRMiTa7ZQKHrdRHKBIOQrTUvjkL1vg
         6PMmzRY+N9CoMrLzizdprfVRLRrtPSAG1ilJy8G52J9bXJvXTN7JHrMtSqZvb6M8Wf8S
         4g9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678114155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bFVOxxJWmcBBAsxjQVvaTc6NhO3PyYN3/IVM+H/3TK8=;
        b=H0/s7jnr0R9udXMb9tB5IebX4tMNjXTdhE1eKeaKmFmnwvpq7+HLheITn/CKvyWiYc
         N5zxZQHXQ+ydA4MDjmcBeLOIoJt3nnZqq27dfphE2flowSa1ovJ3oOusNibcor2MnAe5
         CzXGTChGCjZVkgQvKPJejAJvDMDp5dePwoYDXrCypn9jfteSo/JMJVTAd18MNEW62rRm
         OIGE5gAPzK84ji9YsBLDV9ck4G0NyoHKSPgiaQ1uzZcsw4HRt3YWaWxKYKCQ+rKf/kMg
         k+RalXygyRX7DBxG1nYgKmmu2Ddp44yaeLeVk/S6Ikk7bZ7gMZHC1DJwmcyQ3l61lILS
         R75g==
X-Gm-Message-State: AO0yUKUp/QH1Jw1A0vZs3qSBK2M2zLAERxKMAS1ZJmllgVRGqIei5CmN
        2YNpfsrWTB4hpOZbet9HtE6DCQ==
X-Google-Smtp-Source: AK7set8Y+Txg75rlmOiw6y13eDoYl8DExz4HfdO9c4x195v+eyQ7yohO5Z/vQkJkjEHlsfuOL4JKzA==
X-Received: by 2002:a17:906:384a:b0:8f0:143d:ee28 with SMTP id w10-20020a170906384a00b008f0143dee28mr11127962ejc.16.1678114155460;
        Mon, 06 Mar 2023 06:49:15 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:c1e7:5006:98ac:f57])
        by smtp.gmail.com with ESMTPSA id j22-20020a1709066dd600b008e6bd130b14sm4706760ejt.64.2023.03.06.06.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 06:49:14 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-clk@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        David Virag <virag.david003@gmail.com>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 3/6] clk: samsung: Set dev in samsung_clk_init()
Date:   Mon,  6 Mar 2023 15:49:09 +0100
Message-Id: <167811414390.14916.14779906355644398581.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230223041938.22732-4-semen.protsenko@linaro.org>
References: <20230223041938.22732-1-semen.protsenko@linaro.org> <20230223041938.22732-4-semen.protsenko@linaro.org>
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

On Wed, 22 Feb 2023 22:19:35 -0600, Sam Protsenko wrote:
> Some drivers set dev to context in order to implement PM. Make that part
> of samsung_clk_init() instead of assigning `ctx->dev = dev' separately.
> 
> No functional change.
> 
> 

Applied, thanks!

[3/6] clk: samsung: Set dev in samsung_clk_init()
      https://git.kernel.org/krzk/linux/c/211e03f66a15d1e90ee2cddebb7e3b5bf0af50a9

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
