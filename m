Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB1E47DE783
	for <lists+linux-clk@lfdr.de>; Wed,  1 Nov 2023 22:46:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345511AbjKAV1i (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 1 Nov 2023 17:27:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345125AbjKAV1h (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Nov 2023 17:27:37 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A0FFD59
        for <linux-clk@vger.kernel.org>; Wed,  1 Nov 2023 14:26:58 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-da077db5145so251061276.0
        for <linux-clk@vger.kernel.org>; Wed, 01 Nov 2023 14:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698874018; x=1699478818; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qwvcIFx1x2xKOK8vInsz3+h6jH8AxfiD9ppPw8p0zVU=;
        b=Lmzw8VxUGoEhKu53Q19/A8yhd+nHgbZzjxzHikHDHqsU9d87mQfRjqdJVPZvFBBZ/F
         rt1Lx6uMxvKktElKE73xE1TRuwdXgupfUB4dz8JkXhPDdTF8XJkfSeSRYuzq39unldZT
         umra8dnBw1IZhlufmTv4NozG+c3yu6qUm+jcZfO5i8WPYCt/6xpEp/TSdV+PmBtBkB3c
         g6bOaTdJbmKQdCp4CKUibSj3Kom0M6TB1adp3FHr5Ky1JK+0W1N+cAyxyU86v3UbZUo3
         KC4YQJCkCBlmU0IirdaWJkAkqCFXc+UGSG42SE6cfGv4PufTyT/MvCWsc/yFvtGwacgR
         pVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698874018; x=1699478818;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qwvcIFx1x2xKOK8vInsz3+h6jH8AxfiD9ppPw8p0zVU=;
        b=ROHA9CaFJR/bKpmOpWDvt2/h8NHFaZWib9izad6KsptaoUvPHJCVRekwe9TpD2HFAZ
         MOulMpwM5KVstf5sHbjGN21GZvFZompZtR+ZsVK7lCEBfpSnBo2/lZCEvOL7Gx8mEMsX
         MpsTOjK109jzZT5uIPTh8r3pa078DemiqsSSnWT+NuOHdmEbyiYSah+iqS2XeMoXYyUx
         uzxwqnDCjLFyy5Wdy2bNHRy+nSwBxVK6OTpe0F+cRfWJ3Gg1/GMuAnbEx2F3OhScq6Lq
         oowVJ9bLl66HMqWTi2B3r4g2bhYXl/Fr56IQiZ0q5wLbF6DHTN2LhUXudwPt8uaKoqlB
         Swnw==
X-Gm-Message-State: AOJu0YzYQGYZ5+brs/TYPu74KmCEbolUGn8e939x/Ai7u8TKJy9H25IL
        XraNniUUyHufFV7+YNvHQKWpMrinbVTNn71i9hteZg==
X-Google-Smtp-Source: AGHT+IFNFUT/yrpeYmeI9UzNEtwEugX28B6zv7+mKVcZeC1p52A0159sap29DPJOxBLy1xzSHmKHJ/hvPBOi6ZZXZjs=
X-Received: by 2002:a25:cbc4:0:b0:da0:6876:c20d with SMTP id
 b187-20020a25cbc4000000b00da06876c20dmr16304686ybg.19.1698874017783; Wed, 01
 Nov 2023 14:26:57 -0700 (PDT)
MIME-Version: 1.0
References: <20231101-gdsc-hwctrl-v3-0-0740ae6b2b04@linaro.org> <20231101-gdsc-hwctrl-v3-2-0740ae6b2b04@linaro.org>
In-Reply-To: <20231101-gdsc-hwctrl-v3-2-0740ae6b2b04@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 1 Nov 2023 23:26:46 +0200
Message-ID: <CAA8EJprVZ=FEMwn_oB7O840aen3u7f3xknNQukbw8TODxRhB4A@mail.gmail.com>
Subject: Re: [PATCH RESEND v3 2/5] PM: domains: Add the domain HW-managed mode
 to the summary
To:     Abel Vesa <abel.vesa@linaro.org>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Taniya Das <tdas@qti.qualcomm.com>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-media@vger.kernel.org,
        Taniya Das <quic_tdas@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 1 Nov 2023 at 11:06, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> Now that genpd supports dynamically switching the control for an
> attached device between hardware- and software-mode,  let's add this
> information to the genpd summary in debugfs.
>
> Suggested-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>  drivers/base/power/domain.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

--
With best wishes
Dmitry
