Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C62FD4765BF
	for <lists+linux-clk@lfdr.de>; Wed, 15 Dec 2021 23:28:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231416AbhLOW2Q (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 15 Dec 2021 17:28:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231514AbhLOW2C (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Dec 2021 17:28:02 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBB33C06179E
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 14:28:01 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id t23so33731525oiw.3
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 14:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tO9OvjlWQgMnpqUAi1fL5yqqo8vFsalTCr+DeKw7iAs=;
        b=d8ErCmKms+o1/Zn/sq+RLlNUOstpU2sU17TVwPIGK6cIX6amme+Thn2xHVY+4f9m49
         ZrAUcs6xvNClcjNmPZTTkfZ+tnRnGTDqlSxSRprIb4smCjOiDBOPQhHjOQ7oUwXVdqCG
         nAxJtrQ4SXEnf0LA8KEZYj5IZ76t1E5WQeDEmdxQ54vlF5Cm5CfZ+IIvn+HsBmUcgnOa
         FDQGvzzZq4NKXhpGbZDeiuMvkw1Db/M/3YvYvTdFW9oaURWAt6o5EvjDYO7Dhi5OqctQ
         Crcg1WmgvrQpoGuHawDC2//6PUqLjabnWz8423/mxGi9IvDzCtFokcorJUR/MLekKfoB
         v1hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tO9OvjlWQgMnpqUAi1fL5yqqo8vFsalTCr+DeKw7iAs=;
        b=fHMlsIuVB48xNaKYGSC5cN0J6J/Ls3ky32drXkfyvxSLsjEt2vk9q7PIwONbdwDl1Q
         tiw4Ncx2urYW7nkgwIIF9Rqki0Mmk9GGmQ8A3P+8qSaZXI9Rq6hWI/lhR/wIuv+8Rd5i
         S9eczmoDVjt4CZN2LlMdxQFVc9OMP7TAnnqzzwamwX4oPihrE/el8u3bjd+Vz6BaSNy+
         6QbCI1Cs4YoKe9wAXJhAR8wQvJ9mNVOejVOM5uwJWZAbM01iMkQOYx+Ze0CKeIEY6MKZ
         TrNcstm1CyyrU9w1Ik7rSlBn89ABC7jd9s4zkvK7KBgTRHcHD6o6CeDLHwXXVZJMJUo7
         R1Rw==
X-Gm-Message-State: AOAM530U5w8ZTdCULLB6kWt3Tu3AppxKBtQbsDO4Lhq9t+fmviwj4rov
        0e/6y2TmlfgC+seJZynfRN04akFY0pWEJQ==
X-Google-Smtp-Source: ABdhPJwMB/3+smB7srZ+aOYzMN+Td6q3jqaXkb1hgsRtRZ1qSd6p5ggBHSgQPg5xqiZfhtlnMPgJVA==
X-Received: by 2002:aca:c650:: with SMTP id w77mr1910129oif.8.1639607281131;
        Wed, 15 Dec 2021 14:28:01 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t14sm700500oth.81.2021.12.15.14.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:28:00 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     agross@kernel.org, robh+dt@kernel.org, sboyd@kernel.org,
        mturquette@baylibre.com, quic_vamslank@quicinc.com
Cc:     manivannan.sadhasivam@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v7 0/3] Add PLL and GCC clock support for SDX65
Date:   Wed, 15 Dec 2021 16:27:33 -0600
Message-Id: <163960723735.3062250.6842300885668139659.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1638861860.git.quic_vamslank@quicinc.com>
References: <cover.1638861860.git.quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 6 Dec 2021 23:32:48 -0800, quic_vamslank@quicinc.com wrote:
> From: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> 
> Hello,
> Changes from v6:
>  - Addressed stephen's comments related to GCC and PLL patches
>  - separated PLL and GCC patches from rpmh patches as suggested by Bjorn
> 
> [...]

Applied, thanks!

[2/3] clk: qcom: Add LUCID_EVO PLL type for SDX65
      commit: 1b967c3f33f2c1e1d3dc1a4c110fd2cbe5fcaf16
[3/3] clk: qcom: Add SDX65 GCC support
      commit: 7a12dba6bf1e278a204b48b510f3670081303165

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
