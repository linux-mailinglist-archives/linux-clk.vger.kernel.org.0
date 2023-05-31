Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 862187189CE
	for <lists+linux-clk@lfdr.de>; Wed, 31 May 2023 21:08:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbjEaTIZ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 31 May 2023 15:08:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbjEaTIV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 31 May 2023 15:08:21 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2B55124
        for <linux-clk@vger.kernel.org>; Wed, 31 May 2023 12:08:16 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f3a99b9177so7525010e87.1
        for <linux-clk@vger.kernel.org>; Wed, 31 May 2023 12:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685560095; x=1688152095;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nLeh9eTZK/iy52m5alnxSBqGkGFfx0tmo+Oe0Qn+cRs=;
        b=B3kdqJ0Nj3yy6knwe7dfRO3XybG9Npelq21B4MzJU/FbRMTkjqllrTKLSOObfyvjL1
         03lPINoj0nMTe4xmxY9SXekhvVmy8Ko2AcVUb0idj4mtCJE6o3Oh6+CzN2XwfqpLH9KM
         udSHc+pde0TM5+rM/EDc94/vfMjjAO13xJpErtCKEmw0hbH1h0apbbRfJUakKhwqF/ld
         g4TqN2EafFLwiXKmFaeVRE60Ny5u8kK2EJ50MyBpzXNLiaGkYnnMEi6BJW5fu4mLS2ZE
         /uujRUVXaHyWLQ5KCkTtFJ8esgUFUNA/5RRKiqWICcZuNLhQxHnag2JYAGn9H7/3tgAF
         tpnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685560095; x=1688152095;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nLeh9eTZK/iy52m5alnxSBqGkGFfx0tmo+Oe0Qn+cRs=;
        b=gt/peITkTviUVB/MnmhLHYiwHpWNQR+Y2DlCXJUPbUvOxA2BKRD8EafHKgF1QfSz3g
         O962/TVXj90C36u2Bdv3RXJtpqg6nHo2Ro2qXy4q7DT2a8/gn/v89hrqYmrZzSV30OSX
         gQt3MtN0Wx7122gg6eaZbWER9xMbiOszt290mxefZVFSmY+73SMvmlpmqDhCMolb7A0L
         uCGRzGDLQJCHSpOElhs65fpf1de/zNKP/n8WlhrlYyi8bfTTdP4OforXazXZ4UQ+OBVu
         /x0ZDqSKkCWh+7QL0DwRgpErpme5X32lD2FfSnZfbNq0zt3xikTJXFQB7r0VALJ5F+Gg
         qicw==
X-Gm-Message-State: AC+VfDx9M3rn2eUvaNThjl+LH62kq0dHpQJaMLdVtHR7DCplweMcLdPV
        2ASw1E6qHeyGTcs4XHqCRDOVrg==
X-Google-Smtp-Source: ACHHUZ6ZEWfmryx0i2TJPHxYApweZnfBT4HOp9PcHegXwNz0HNcZLLwV860RYbltG0z295nxml8AnA==
X-Received: by 2002:ac2:4c14:0:b0:4f3:8c0d:41bc with SMTP id t20-20020ac24c14000000b004f38c0d41bcmr11771lfq.16.1685560094898;
        Wed, 31 May 2023 12:08:14 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id i7-20020ac25227000000b004f3b4d17114sm820935lfl.144.2023.05.31.12.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 12:08:14 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/2] (no cover subject)
Date:   Wed, 31 May 2023 21:08:09 +0200
Message-Id: <20230531-topic-sm61125_gpucc_flag-v1-0-f59dd1350781@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABmbd2QC/x2NUQqDMBAFryL73UASGwu9Simyxk1cSGPIaimId
 2/wcx7MmwOEKpPAszug0peF19zA3DrwC+ZIiufGYLXtteuN2tbCXslnMMa6MZbd+zEkjOpOYXB
 OPzRZhKZPKKSmitkv7SDvKbWxVAr8u3qv93n+AQLOdyJ/AAAA
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685560093; l=512;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=0A4SFe6oGfeeE8dBFXJat5w0hpLRzQixPt9UTqzA6zg=;
 b=LUBcJNHDNzkqfBABiwYilyD8pQQnosbL+kt0KQ/QLGyjGJEE1EbUR9/9xSDmlImnyqr7eNSYD
 +IGtLunGhOHD1ImtvJ78+zNqKNJLcgqr0dKRacgh8VANIzTJeCqiNuL
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (2):
      clk: qcom: gcc-sm6115: Set up flags on GPU mem_iface clk
      clk: qcom: gcc-sm6125: Set up flags on GPU mem_iface clk

 drivers/clk/qcom/gcc-sm6115.c | 4 ++++
 drivers/clk/qcom/gcc-sm6125.c | 4 ++++
 2 files changed, 8 insertions(+)
---
base-commit: d4cee89031c80066ec461bb77b5e13a4f37d5fd2
change-id: 20230531-topic-sm61125_gpucc_flag-4ef655070e2a

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

