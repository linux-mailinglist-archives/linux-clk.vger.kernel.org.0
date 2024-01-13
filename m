Return-Path: <linux-clk+bounces-2436-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D250382CEC1
	for <lists+linux-clk@lfdr.de>; Sat, 13 Jan 2024 22:19:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3518D28289B
	for <lists+linux-clk@lfdr.de>; Sat, 13 Jan 2024 21:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2784107B3;
	Sat, 13 Jan 2024 21:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JSHz/DwC"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C7A10796
	for <linux-clk@vger.kernel.org>; Sat, 13 Jan 2024 21:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-783310bd2d3so518203085a.0
        for <linux-clk@vger.kernel.org>; Sat, 13 Jan 2024 13:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705180737; x=1705785537; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pF267Ysjv3yeYbmL5BLV4HmrOUtS1bnSSAX8PIAFU4E=;
        b=JSHz/DwCP08/K3W4ctmgcIi32pa7dyzXSgbCOs5vgRdDqOUnbFIPSbvEzDdw1zhUDO
         f0Y9BfhT1IR0jbcZI/BiRm1jqRbY5YtPEddcGyDDc9saOwgMmSEEXLgwwy83k5Ot7qX2
         9aTqnl8y3VmJ/IzyI2cIRaYU1bmd7Lihx4oEi9C+FeDVM/ydwOK3LIJCA0RGSXioAdry
         mhIZS4S1gI1AoIZvolIDuYqTnrpridHgdPf1wdgkzfIyoChjTR3B/xlayMtkL0XCimkP
         PV8tnPNrdtGw6FrVi5mpxP4sMDZ6Qrxjb7ypRxIdjR6IJHCJxVpJEHl40J1txeVWciLs
         Smvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705180737; x=1705785537;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pF267Ysjv3yeYbmL5BLV4HmrOUtS1bnSSAX8PIAFU4E=;
        b=KFJReUmmOwcs8mMfi876Zc4rEmw1gSvQ4nlrBludTEsK6zgkwJBrwwUvMSDKSYZj2r
         9DlIChd107JPTx1jhwKgRFzjtDgJUC93SP+fPPm4TyjiH6p7eTDkXlyjrgK/rP32Awoc
         AV1WjgZXGwlUPS1H8lI59SOl3CLDZVC4b/ADRmHGkUYrZFn4nuRcO+X83FzezgsnNhrT
         ALq30gOpppyojVne0CsJDzVZFULE8OV+EG/9CGc10mE/RtVpLrp2y7g0017UWePBVWg2
         aDoNkCl0MRMZRZUqEMZ8SqtLPpQislTVx6rSniUfjsWmfKTGkpsqaxLuk+b1uX8bFgyi
         eZjA==
X-Gm-Message-State: AOJu0Yw8TuF7tEsBDSfVIYqs2Kk+yoSGxkG9IO7m5wXEPfpfjm/vi4xE
	3Nv4UpAn9YBYIdeeThxqCYnr9RegyNSucDsTO3akLWOhAghZCg==
X-Google-Smtp-Source: AGHT+IFW5WFJ1VVn2gfjgR6yZAmOCMsb23RNVbx4JnwY4Xn0MjzArTCCtrJfArzBn+QB7riuISNuBSsR4XFia86J6V4=
X-Received: by 2002:a05:620a:2181:b0:783:528e:6c25 with SMTP id
 g1-20020a05620a218100b00783528e6c25mr1412770qka.49.1705180737425; Sat, 13 Jan
 2024 13:18:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230717-topic-branch_aon_cleanup-v6-0-46d136a4e8d0@linaro.org> <20230717-topic-branch_aon_cleanup-v6-1-46d136a4e8d0@linaro.org>
In-Reply-To: <20230717-topic-branch_aon_cleanup-v6-1-46d136a4e8d0@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 13 Jan 2024 23:18:46 +0200
Message-ID: <CAA8EJpoaQi57ERjSkGbNj_YbO-Gv-ybyreG6Dm+KQhp5uQM2zQ@mail.gmail.com>
Subject: Re: [PATCH v6 01/12] clk: qcom: branch: Add a helper for setting the
 enable bit
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 13 Jan 2024 at 16:51, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> We hardcode some clocks to be always-on, as they're essential to the
> functioning of the SoC / some peripherals. Add a helper to do so
> to make the writes less magic.
>
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/clk/qcom/clk-branch.h | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

