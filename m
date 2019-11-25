Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AF4C108B75
	for <lists+linux-clk@lfdr.de>; Mon, 25 Nov 2019 11:14:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727399AbfKYKO6 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 25 Nov 2019 05:14:58 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52477 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727215AbfKYKO5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Nov 2019 05:14:57 -0500
Received: by mail-wm1-f66.google.com with SMTP id l1so14777715wme.2
        for <linux-clk@vger.kernel.org>; Mon, 25 Nov 2019 02:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=K61KDC/w3VRipSxtXvNga+5fh0z8paKLB1vFxmok1y4=;
        b=sA4wb45ovcGlqxPBCSA49oBborhJUSfY00UQh7VAfyxGrbMtidhQVtYZFRyr3wqOJA
         G/m4e9avLJSZHR1Z5k0yAZxZw48uBaTsChuzi6kJbExRffn8gEstelaJfoOhbUlKfUqh
         u2MBHnSlbHS7ztMLwvFR9EAG81WCr2HReBT/ByfS60J/hJQyFuRop2IIpnhwp3xTuIuZ
         2Sqshnu6va75Q7n2VH2ZZ0G8nnp/BnQazRgPdcJmtUS6SGGjTEOSlJjcB1B+0KzcgPk0
         w7eo3ivs+Vgev8jpsJVwduhhIVQC0Jj3RVvbQ7jTcLZG6i3vvqnzeH0x6iWNS6d4ZPU8
         aRXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=K61KDC/w3VRipSxtXvNga+5fh0z8paKLB1vFxmok1y4=;
        b=poHWGCW57OKNvBXp7xU+PUeEJMffo8dEAO5/5Uw9V1SSStlD4uBZFrl23aD4mMXdCr
         28cZXhSIg8vkCcCH4Xe5FMVK/l/R1UbF9DZivvb1dGuOkgRcGPsTt5aVPiBkpFYC3xB0
         fpO+ianpD7C1ZPUJNPuC+HWcSXgxe+v1TouKbVHQPngWZq306iSkGxmWqwWEDrrEHrQ0
         EedIHrUoQYIz+jP8qzFCdytQLcQeMo0Asb5o+KbM+Jh+Y+hne98tP0HGbAOLKIW0JRlC
         katbNlVRi4uLukKtrXa11qTxwiXoa3/BruQD75GBVJ+nuClroYobUEPfsYMlCieeDJjw
         Ys/A==
X-Gm-Message-State: APjAAAXF8eCCXnGyV4UvFEhi5EgndFQuENBvtaT0/79c5nQH5zeRA3mJ
        2lcHdI9L4nm24QCMjwcXzqxp2Q==
X-Google-Smtp-Source: APXvYqxlqGbRVb1q7Ats9JEHWlI6DXCc42Eir63k/2XjzqDQfir3rntlAPQcFe8O/L4oiGkYaRuCRQ==
X-Received: by 2002:a7b:c76a:: with SMTP id x10mr26459343wmk.123.1574676895066;
        Mon, 25 Nov 2019 02:14:55 -0800 (PST)
Received: from localhost ([2a01:e34:eeb6:4690:ecfa:1144:aa53:4a82])
        by smtp.gmail.com with ESMTPSA id 60sm8778477wrn.86.2019.11.25.02.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 02:14:54 -0800 (PST)
References: <1571382865-41978-1-git-send-email-jian.hu@amlogic.com> <1571382865-41978-4-git-send-email-jian.hu@amlogic.com> <1jsgnmba1a.fsf@starbuckisacylon.baylibre.com> <49b33e94-910b-3fd9-4da1-050742d07e93@amlogic.com> <1jblts3v7e.fsf@starbuckisacylon.baylibre.com> <f02b6fb2-5b98-0930-6d47-a3e65840fb82@amlogic.com> <1jh839f2ue.fsf@starbuckisacylon.baylibre.com> <20d04452-fc63-9e9e-220f-146b493a860f@amlogic.com> <1695e9b0-1730-eef6-491d-fe90ac897ee9@amlogic.com> <1jtv6yftmm.fsf@starbuckisacylon.baylibre.com> <9e652ed1-384e-f630-f2a4-0aa4486df577@amlogic.com>
User-agent: mu4e 1.3.3; emacs 26.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Jian Hu <jian.hu@amlogic.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>,
        "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Chandle Zou <chandle.zou@amlogic.com>,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] clk: meson: a1: add support for Amlogic A1 clock driver
In-reply-to: <9e652ed1-384e-f630-f2a4-0aa4486df577@amlogic.com>
Date:   Mon, 25 Nov 2019 11:14:53 +0100
Message-ID: <1j7e3oqn36.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Thu 21 Nov 2019 at 04:21, Jian Hu <jian.hu@amlogic.com> wrote:

> Hi, Jerome
>
> On 2019/11/20 23:35, Jerome Brunet wrote:
>>
>> On Wed 20 Nov 2019 at 10:28, Jian Hu <jian.hu@amlogic.com> wrote:
>>
>>> Hi, jerome
>>>
>>> Is there any problem about fixed_pll_dco's parent_data?
>>>
>>> Now both name and fw_name are described in parent_data.
>>
>> Yes, there is a problem.  This approach is incorrect, as I've tried to
>> explain a couple times already. Let me try to re-summarize why this
>> approach is incorrect.
>>
>> Both fw_name and name should be provided when it is possible that
>> the DT does not describe the input clock. IOW, it is only for controllers
>> which relied on the global name so far and are now starting to describe
>> the clock input in DT
>>
>> This is not your case.
>> Your controller is new and DT will have the correct
>> info
>>
>> You are trying work around an ordering issue by providing both fw_name
>> and name. This is not correct and I'll continue to nack it.
>>
>> If the orphan clock is not reparented as you would expect, I suggest you
>> try to look a bit further at how the reparenting of orphans is done in
>> CCF and why it does not match your expectation.
>>
> I have debugged the handle for orphan clock in CCF, Maybe you are missing
> the last email.

Nope, got it the first time

> Even though the clock index exit, it will get failed for the orphan clock's
> parent clock due to it has not beed added to the provider.

If the provider is not registered yet, of course any query to it won't
work. This why I have suggested to this debug *further* :

* Is the orphan reparenting done when a new provider is registered ?
* If not, should it be done ? is this your problem ?


