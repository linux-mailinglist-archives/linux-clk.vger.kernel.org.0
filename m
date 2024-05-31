Return-Path: <linux-clk+bounces-7596-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E28438D683E
	for <lists+linux-clk@lfdr.de>; Fri, 31 May 2024 19:39:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70A6BB24C17
	for <lists+linux-clk@lfdr.de>; Fri, 31 May 2024 17:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D4E617CA03;
	Fri, 31 May 2024 17:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hQx/Ih5H"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A836317C7DE
	for <linux-clk@vger.kernel.org>; Fri, 31 May 2024 17:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717177175; cv=none; b=JFGatDxB8qZVzqA9qX5T7aO/IiSJRb28hfFne3rvC3RbalkNWbmOe0lRH2DetDxbMHh7faVp4czgWMvrPAgoP4b/hGJFWvc+n9SivX4907a45b8+7Mtg/L4LFfjX+kJaQWGD38Sd6rqdZY4pylf6m7BqY01kLShGTgueYbosWXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717177175; c=relaxed/simple;
	bh=PzdmUDU3SWlU3IKidPUsdT6fM1IqaOEod+sGZdxJ3eI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EmQAaZWMDJIKROHS7QkZjsUH2i04f9zntcQBCnxKnkf7lbgy94N0aBdLog0L5woeHePAv2Yu/T1YUuE3KWIzDRZPOfem3/7/mlMXNsKREnNCFZUXkIlJ9j2C8a1tkKMnAv1AJrx7SWnAizKOej/wUkANenTKKC1Ttkxf2cPCpgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hQx/Ih5H; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dfa71ded97bso804078276.1
        for <linux-clk@vger.kernel.org>; Fri, 31 May 2024 10:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717177173; x=1717781973; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e5V80uMpIIHXc+5LdtOp/W0iR82wcJaJTavrV/rpZj4=;
        b=hQx/Ih5HN3VJ7lkybai7djI0Tme8sE/JdRs/QEK5SS8dMLWF8Xnm0AKm/YPkPNR7Vh
         aWC7w6KXPzNpHu8TnQSlQPdFq8XMMeTToQ+xK0BOkL2zhVZ+5gMxX1xVG8a7/qrHvoRa
         w4oYxtaps2BWpUfBVe15ENRpHBzB1oHhKOC9Y3cTL/bHSIlawRd8aXCXbwf6nGee5ZkT
         bQhOdxXuNTjwZg5CSABKXnn0i0R7ChaaUGHy1bOzkZZD8ElGK3XSznVQB/KSeOK98LLM
         +QEYFmGrvpJyvTx3Eczxdd8P+akRl90ECE5yxADVMBHN+8K1IS4Vi14Dx173m/n9Eiml
         +eRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717177173; x=1717781973;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e5V80uMpIIHXc+5LdtOp/W0iR82wcJaJTavrV/rpZj4=;
        b=utg+EPy3gEQsUw+NTAOzVcAHmaWYBdGMmPgxPBPcEJjIQAXF51DfENYWEFYx0JTdch
         92q+OwRitd4AQUNFCHK2AnhLZvapJQC4AbmyKf3g5iJQdmsHcx770n+MDQDhqrreUzea
         dxr6HwzphPmI0uE463PVoAiEvTYBdGqiYnKqIhU2haTVsBKAv7oEpTPAFUK2J0hsJbaV
         bZ8oEHF/mFF1n3ajgxXqtmY3TuhaGnW554SO2RHU6AwXJ6A/GdNjmHPHgP1AKFpcBD+G
         6g3m2cjUUpRucYHvPvQDO8lQxi+JakxLPJ8oX16YXgTnUmFRHgNjL8tml4cN9xas3jyK
         NBxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMBTjO25dNE09vJ6Qe2GuZ+1qnJ1Tj+i8b31tQ4YD7nzEKFLKDiOqaU3ydF3n/htUCcYSNw4DnztqHjc+W1Cla9HfmJUzg61i8
X-Gm-Message-State: AOJu0YxXrQVq/M0HKA81ObSfCcbCrqyeoWiFBkIySgJBjAOCbygwTmvD
	rYuQQtcIdPkJanNgQBhjUmOzntg1hCCSDLMBTBDOsi3HnUC6LcdFFJkmnbFbj4o/9c0yvUPPkyL
	MgVYX5CmX27jTlkgkhhUo8FWxaGf9WvEXl8Px3A==
X-Google-Smtp-Source: AGHT+IEXnK9LdU1Sd4QTI/Pted/ljjrPJBKy0MOouFqYqBZ6C8Fxg28XZ8RCoKQbK+aHOloAvYXkSgJ4JAVE3Vl4Y9k=
X-Received: by 2002:a25:bdc1:0:b0:df4:7a85:d603 with SMTP id
 3f1490d57ef6-dfa5d81886amr4603843276.10.1717177172674; Fri, 31 May 2024
 10:39:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240531-dt-bindings-qcom-gcc-v1-0-b37d49fe1421@linaro.org>
 <l73uszlhnhyamfuwm7f6bbmockttwihsylkkgbyedkdseznlka@mtr5c7r4nqt4> <8ac8cc27-6c39-45fe-bdc2-40a310c815cc@linaro.org>
In-Reply-To: <8ac8cc27-6c39-45fe-bdc2-40a310c815cc@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 31 May 2024 20:39:31 +0300
Message-ID: <CAA8EJpo56ymWsLJo9QU4VXTK=rnLQrp3dR+pXGK6ECAjU0PE5w@mail.gmail.com>
Subject: Re: [PATCH 00/16] dt-bindings: clock: qcom: reference qcom-gcc.yaml
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Konrad Dybcio <konrad.dybcio@somainline.org>, 
	Jonathan Marek <jonathan@marek.ca>, Del Regno <angelogioacchino.delregno@somainline.org>, 
	Loic Poulain <loic.poulain@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 31 May 2024 at 18:19, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 31/05/2024 17:14, Dmitry Baryshkov wrote:
> > On Fri, May 31, 2024 at 03:52:18PM +0200, Krzysztof Kozlowski wrote:
> >> Hi,
> >>
> >> Unify Qualcomm clock controllers by referencing qcom,gcc.yaml where
> >> applicable.  Several existing bindings for these display/GPU/CAM clock
> >> controllers already do it.
> >
> > The series looks good to me with a single point in mind. You are writing
> > that dispcc/videocc/etc are a variant of GCC. However GCC is a Global
> > Clock Controller.
>
> Yeah, that's simplification from my side and assumption that at first
> they designed GCC and then they copied the design to other blocks.
>
> > What about renaming qcom,gcc.yaml to
> > qcom,cc-common.yaml ? Then the rest makes total sense to me.
>
> Several gpu/disp/cam clock controllers already include qcom,gcc.yaml, so
> I would say this should not be a requirement for this patchset.
>
> We can rename, although it always is a bit of churn - git log needs
> special option, backporting is a bit trickier.

Ok. For the series:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

