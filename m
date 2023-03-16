Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FE4E6BC527
	for <lists+linux-clk@lfdr.de>; Thu, 16 Mar 2023 05:16:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbjCPEQG (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 16 Mar 2023 00:16:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbjCPEQF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Mar 2023 00:16:05 -0400
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0259FAA73C
        for <linux-clk@vger.kernel.org>; Wed, 15 Mar 2023 21:16:00 -0700 (PDT)
Received: by mail-vs1-xe32.google.com with SMTP id x14so418340vso.9
        for <linux-clk@vger.kernel.org>; Wed, 15 Mar 2023 21:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678940159;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VJCqKRE4d1ltZDxf6SNz7C5CqOyKWw1J4LAwmwk+DMM=;
        b=MXM5ZX5zs1asHya3HxX5br+6G/T0zj+Nl5VTmZNye6Zk49nd8gLxxy6vLJCYbtB6W+
         FbAGomGokBQ9eLcABDxaF5R5A8gQMoppZNAd8IS4HAFIU35wpPt4FBYXtIrrapIXhkOe
         xSimZqLWpdtmyYG+8a4e69Hy35ux+7qdC+DlvROO4C0aWmj+monIzTP2Idm5YKKE0f3i
         sPJmwXmK8p3DBIoMk5VdwiBCmiIpIbsWxohhiZMEcLJw+lU0tDf/h8konLWS+gZ6nDvO
         wDxaJ6vXLzfGYnMvSGugQ4+jOVukEx/VCPsMmHoVJhk6w9AlVkMHLp3HlwsXQWMx7HT6
         j5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678940159;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VJCqKRE4d1ltZDxf6SNz7C5CqOyKWw1J4LAwmwk+DMM=;
        b=qq3uPIYCzSbJrQEUY2OKWsM0fLX0GGQrPBXlwN+JKwHVlFeUIpwFs+uTCU/FoU4/3+
         pzRZYJF4gEM21FcVudqxXoxRApzBt6BYUD3Vs8hW3qRySGxHy3Juxr3WUuozHEXK+CWZ
         1NhVWXWYI2QAo5DyzsvE6zEPMEKIuDqdWui24in3ZIm5DOSpmLuu/q6KRQnax67F6Gca
         qpserDazfXoOSebTbV7r7OB/B4kE7yQ4dNQiEVskMxJ1WmhGyLFJXThEwWUlqmzMSov2
         rv/L5VZo9mzpOxgGYat1SE6raAPRmS16Hbhikz/UpTwuvj+iC0CIR8m+d9aMBKqD5eQ8
         dXPQ==
X-Gm-Message-State: AO0yUKWEvTMSHD2Pn2mnGWUAGeXq5jXZqCYKJWev1u77WA6/qbGB2rxP
        4v+OS0hADN2KCMRD1tWOVCzWb+d+fTQ28J8KfhVIqg==
X-Google-Smtp-Source: AK7set+d1+EeMKuullca832l9FKkqqU6QiaHEn/qoK63n1waQEPlF55lmA1toIVFgXJyM3k7mMkdy+iOXUnsvpwyl1s=
X-Received: by 2002:a67:fd7a:0:b0:416:f1ea:1001 with SMTP id
 h26-20020a67fd7a000000b00416f1ea1001mr27990320vsa.5.1678940158841; Wed, 15
 Mar 2023 21:15:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230302013822.1808711-1-sboyd@kernel.org> <20230302013822.1808711-3-sboyd@kernel.org>
 <CABVgOSkomwwgKZ9N0_0YMDL--QaZiTV7ONgSRABU2Ph1Z0CG-g@mail.gmail.com>
 <a97c9bb3a5addfb34af8ccabaa513026.sboyd@kernel.org> <CABVgOSkJ4mw_DtFzn5EwcsuYixWY_j13YotxEYqWhO+ZCL1KPg@mail.gmail.com>
 <d64a086ddcb7c5ca5abecab0ca654259.sboyd@kernel.org> <CABVgOSk9gqRe_5yQZweBA2Qg2aGx8rUJtOHywGeT4x7TEyBH0A@mail.gmail.com>
 <40299ee6-c518-5505-0dc5-874deef03d19@gmail.com> <e1889f7f-2804-718b-6651-f333aed48e99@gmail.com>
 <CABVgOS=B51mzjVLy35aMp5PSAB=qhzMQVNzvxDVMezYwsOv1zw@mail.gmail.com>
 <b217e613-575e-9e33-3469-6de5e0fb813a@gmail.com> <b05b5e50-413f-0aa8-1842-aef6f846c38d@gmail.com>
In-Reply-To: <b05b5e50-413f-0aa8-1842-aef6f846c38d@gmail.com>
From:   David Gow <davidgow@google.com>
Date:   Thu, 16 Mar 2023 12:15:46 +0800
Message-ID: <CABVgOSnJPKRqAdYtu2bhSxBEehF7BVQH6Rvj1U4xOcGWei8Lig@mail.gmail.com>
Subject: Re: [PATCH 2/8] of: Enable DTB loading on UML for KUnit tests
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        patches@lists.linux.dev,
        Brendan Higgins <brendan.higgins@linux.dev>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        Rob Herring <robh+dt@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-um@lists.infradead.org,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="000000000000cba5c105f6fcb779"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

--000000000000cba5c105f6fcb779
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Mar 2023 at 08:45, Frank Rowand <frowand.list@gmail.com> wrote:
>
> On 3/15/23 16:35, Frank Rowand wrote:
> > On 3/15/23 02:04, David Gow wrote:
> >> On Tue, 14 Mar 2023 at 12:28, Frank Rowand <frowand.list@gmail.com> wrote:
> >>>
> >>> On 3/13/23 11:02, Frank Rowand wrote:
> >>>> On 3/11/23 00:42, David Gow wrote:
> >>>>> On Sat, 11 Mar 2023 at 07:34, Stephen Boyd <sboyd@kernel.org> wrote:
> >>>>>>
> >>>>>> Quoting David Gow (2023-03-10 00:09:48)
> >>>>>>> On Fri, 10 Mar 2023 at 07:19, Stephen Boyd <sboyd@kernel.org> wrote:
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> Hmm. I think you're suggesting that the unit test data be loaded
> >>>>>>>> whenever CONFIG_OF=y and CONFIG_KUNIT=y. Then tests can check for
> >>>>>>>> CONFIG_OF and skip if it isn't enabled?
> >>>>>>>>
> >>>>>>>
> >>>>>>> More of the opposite: that we should have some way of supporting tests
> >>>>>>> which might want to use a DTB other than the built-in one. Mostly for
> >>>>>>> non-UML situations where an actual devicetree is needed to even boot
> >>>>>>> far enough to get test output (so we wouldn't be able to override it
> >>>>>>> with a compiled-in test one).
> >>>>>>
> >>>>>> Ok, got it.
> >>>>>>
> >>>>>>>
> >>>>>>> I think moving to overlays probably will render this idea obsolete:
> >>>>>>> but the thought was to give test code a way to check for the required
> >>>>>>> devicetree nodes at runtime, and skip the test if they weren't found.
> >>>>>>> That way, the failure mode for trying to boot this on something which
> >>>>>>> required another device tree for, e.g., serial, would be "these tests
> >>>>>>> are skipped because the wrong device tree is loaded", not "I get no
> >>>>>>> output because serial isn't working".
> >>>>>>>
> >>>>>>> Again, though, it's only really needed for non-UML, and just loading
> >>>>>>> overlays as needed should be much more sensible anyway.
> >>>>>>
> >>>>>> I still have one niggle here. Loading overlays requires
> >>>>>> CONFIG_OF_OVERLAY, and the overlay loading API returns -ENOTSUPP when
> >>>>>> CONFIG_OF_OVERLAY=n. For now I'm checking for the config being enabled
> >>>>>> in each test, but I'm thinking it may be better to simply call
> >>>>>> kunit_skip() from the overlay loading function if the config is
> >>>>>> disabled. This way tests can simply call the overlay loading function
> >>>>>> and we'll halt the test immediately if the config isn't enabled.
> >>>>>>
> >>>>>
> >>>>> That sounds sensible, though there is a potential pitfall. If
> >>>>> kunit_skip() is called directly from overlay code, might introduce a
> >>>>> dependency on kunit.ko from the DT overlay, which we might not want.
> >>>>> The solution there is either to have a kunit wrapper function (so the
> >>>>> call is already in kunit.ko), or to have a hook to skip the current
> >>>>> test (which probably makes sense to do anyway, but I think the wrapper
> >>>>> is the better option).
> >>>>>
> >>>>>
> >>>>>>>
> >>>>>>>>>
> >>>>>>>>> That being said, I do think that there's probably some sense in
> >>>>>>>>> supporting the compiled-in DTB as well (it's definitely simpler than
> >>>>>>>>> patching kunit.py to always pass the extra command-line option in, for
> >>>>>>>>> example).
> >>>>>>>>> But maybe it'd be nice to have the command-line option override the
> >>>>>>>>> built-in one if present.
> >>>>>>>>
> >>>>>>>> Got it. I need to test loading another DTB on the commandline still, but
> >>>>>>>> I think this won't be a problem. We'll load the unittest-data DTB even
> >>>>>>>> with KUnit on UML, so assuming that works on UML right now it should be
> >>>>>>>> unchanged by this series once I resend.
> >>>>>>>
> >>>>>>> Again, moving to overlays should render this mostly obsolete, no? Or
> >>>>>>> am I misunderstanding how the overlay stuff will work?
> >>>>>>
> >>>>>> Right, overlays make it largely a moot issue. The way the OF unit tests
> >>>>>> work today is by grafting a DTB onto the live tree. I'm reusing that
> >>>>>> logic to graft a container node target for kunit tests to add their
> >>>>>> overlays too. It will be clearer once I post v2.
> >>>>>>
> >>>>>>>
> >>>>>>> One possible future advantage of being able to test with custom DTs at
> >>>>>>> boot time would be for fuzzing (provide random DT properties, see what
> >>>>>>> happens in the test). We've got some vague plans to support a way of
> >>>>>>> passing custom data to tests to support this kind of case (though, if
> >>>>>>> we're using overlays, maybe the test could just patch those if we
> >>>>>>> wanted to do that).
> >>>>>>
> >>>>>> Ah ok. I can see someone making a fuzzer that modifies devicetree
> >>>>>> properties randomly, e.g. using different strings for clock-names.
> >>>>>>
> >>>>>> This reminds me of another issue I ran into. I wanted to test adding the
> >>>>>> same platform device to the platform bus twice to confirm that the
> >>>>>> second device can't be added. That prints a warning, which makes
> >>>>>> kunit.py think that the test has failed because it printed a warning. Is
> >>>>>> there some way to avoid that? I want something like
> >>>>>>
> >>>>>>         KUNIT_EXPECT_WARNING(test, <call some function>)
> >>>>>>
> >>>>>> so I can test error cases.
> >>>>
> >>>> DT unittests already have a similar concept.  A test can report that a
> >>>> kernel warning (or any other specific text) either (1) must occur for the
> >>>> test to pass or (2) must _not_ occur for the test to pass.  The check
> >>>> for the kernel warning is done by the test output parsing program
> >>>> scripts/dtc/of_unittest_expect.
> >>>>
> >>>> The reporting by a test of an expected error in drivers/of/unittest.c
> >>>> is done by EXPECT_BEGIN() and EXPECT_END().  These have been in
> >>>> unittest for a long time.
> >>>>
> >>>> The reporting by a test of a not expected to occur error is done
> >>>> by EXPECT_NOT_BEGIN() and EXPECT_NOT_END().  These are added to
> >>>> unittest in linux 6.3-rc1.
> >>>>
> >>>> I discussed this concept in one of the early TAP / KTAP discussion
> >>>
> >>> The link to the early KTAP discussion on this concept is:
> >>>
> >>>    https://lore.kernel.org/all/d38bf9f9-8a39-87a6-8ce7-d37e4a641675@gmail.com/T/#u
> >>>
> >>>
> >>
> >> Thanks -- I'd totally forgotten about that!
> >>
> >
> >> I still personally would prefer a way of checking this from within the
> >> kernel, as if we're just printing out "EXPECT: " lines, then it's not
> >> possible to know if a test passes just from the raw results (and
> >> things like statistics can't be updated without a separate tool like
> >> kunit.py parsing the KTAP.
> >
> > Yes, I totally agree with that.  If there is a reasonable way to
> > implement.  But in the DT unittest world, I have not found a
> > reasonable way.  Adding hooks is suggested below, but for DT
> > unittest _I_ (opinion) do not find that reasonable.  I voice no
> > vote for kunit - that decision is up to the kunit crowd.
> >
> >>
> >> Indeed, my personal preference is that this log-based way of doing
> >> expectations is probably best kept as a last resort. i.e.,
> >> 1. Try to add a hook to the code which prints the message, which can
> >> then fail the test (or set a flag for the test to check later). This
> >> probably needs some better KUnit-side helpers to be truly ergonomic,
> >> but at least avoids too strict a dependency on the exact formatting of
> >> the log messages.
> >
> > I'm not a fan of hooks.  I see them as a maintenance burden, dependent
> > upon the source version of the object being tested, yet another
> > thing that can go wrong, and adds complexity to creating a test
> > environment and running the test.  Again, this just a personal
> > opinion, and I'm not voting for or against this for kunit.
> >

I definitely agree that they've got their problems, and aren't the
right solution for every test.

That being said, I think a few of those problems also apply to
expecting individual error lines, which are basically doing the same
thing, just less explicitly (though with the advantage of serving
another real-world purpose).

> >> 2. If that doesn't work, use console tracepoints or similar to
> >> implement an EXPECT_BEGIN() / EXPECT_END() or similar API entirely
> >> within the kernel.
> >
> > Isn't this just another hook?  So same opinion.
> >

I see what you mean. I guess the distinction I was trying to draw was
between a specific hook, implemented as such explicitly on both sides,
and a generic mechanism for console-message-based expectations.

So the difference is that, once the EXPECT_BEGIN()/EXPECT_END() macros
have been implemented this way, the uses of them should look the same.

> >> 3. Only if we can't come up with a working way of doing the former
> >> options, resort to adding "EXPECT:" lines and having a parser pick up
> >> on this.
>
> Adding one more thought here so I don't forget it before the topic picks
> up again in the KTAP version 2 world...
>
> The test parser could generate an artificial subtest test case status line
> or normal test case status line to report the result of the EXPECT.  This
> also is ugly because it is creating a new requirement on the parser vs the
> expectations in the KTAP plan line (the plan line could include the EXPECT
> in the number of tests count, but then the raw KTAP test output would be
> missing the artificial EXPECT test result).  No need to hash out details
> here, just a thought...
>

Yeah, I think if we have this done at the parser level, our options
are either that or an override.

For KUnit, I think the override makes much more sense, as logically,
any expectation would be considered part of an existing test case.
Maybe we could treat an override as a "subtest" of the current test,
but injecting a test case anywhere else would go pretty seriously
against the KUnit model.

> -Frank
>
> >
> > Again, don't let my opinion affect the voting between 1, 2, 3, or other
> > for kunit.
> >
> >>
> >> One of the downsides of doing "EXPECT" lines in KTAP is that it'll
> >> suddenly be much more dependent on the exact layout of the tests, as
> >> we'd need to be able to override a test result if an expectation fails
> >> (at least, to maintain the KUnit structure). And overriding a result
> >> which is already in the output seems really, really ugly.
> >
> > I don't understand "dependent on the exact layout of the tests".
> > If you are saying that the test result parser has to figure out
> > which test result to override, that has not been an issue in
> > the cases that I use EXPECTs in DT unittest.  The EXPECT begin and
> > EXPECT end have always immediately surrounded a single test, so
> > when the parser processes the EXPECT end, only the most recent
> > test result could be overridden.  This has worked because the
> > kernel warning and error messages have been from kernel action
> > that happens synchronously with the test.  If the test prods the
> > kernel in a way that results in the kernel performing an
> > asynchronous activity (eg in another thread), then it becomes
> > more complex to structure the EXPECT end -- I would imagine that the
> > test would have to block on the asynchronous activity just before
> > reporting the normal KTAP status result for the test (and the
> > EXPECT end would normally be just after reporting the KTAP
> > status result for the test).

Okay: I agree 100% with you there.

I think the difference I was thinking of is more whether expectations
are considered part of an existing test (which may need overriding),
or exist as their own separate test result (as you suggest in the
follow-up email above).

> >
> > I agree with overriding being ugly.  For the DT unittest results
> > parser, the EXPECT summary results are reported separately from
> > the individual test summary results.  The parser also flags the
> > EXPECT failure in line with the normal individual test result
> > lines.
> >
> > I see both parsing results as valid, and as a policy choice for
> > each test parser.
> >

I agree that each parser should have some leeway here, but do think we
want to make sure the results have some sensible, standardised
interpretation, so that we can use parsers interchangeably without
getting totally inconsistent results. That's the big advantage of
standardisation, after all.

My philosophical objection to overriding is that it's really confusing
to have an "ok" line in the results, indicating that a test has
passed, when the test has in fact failed (because the expectation
doesn't match). This gets worse when subtests are considered, and we
have these misleading results bubbled up to reported overall "suite"
results.

I guess one solution is to have an extra layer of parsing, which takes
raw kernel output, verifies the expectations, and then outputs
"processed KTAP", with all of the final results resolved. But that's
ugly in a way, too.

> >>
> >> There's a patch to the KASAN tests to move from doing option 1 to
> >> option 2 above (in order to better support RCU, which didn't work with
> >> the hook):
> >> https://lore.kernel.org/all/ebf96ea600050f00ed567e80505ae8f242633640.1666113393.git.andreyknvl@google.com/
> >>
> >>
> >>>> threads and expect to start a discussion thread on this specific
> >>>> topic in the KTAP Specification V2 context.  I expect the discussion
> >>>> to result in a different implementation than what DT unittests are
> >>>> using (bike shedding likely to ensue) but whatever is agreed to
> >>>> should be easy for DT to switch to.
> >>>
> >>> The link to the KTAP Specification Version 2 process and progress is:
> >>>
> >>>    https://elinux.org/Test_Results_Format_Notes#KTAP_version_2
> >>>
> >>
> >> Thanks! We've got a few more KTAP ideas to air, so will hopefully send
> >> those out soon!
> >
> > Glad to hear, I'm hoping that process starts progressing a bit.
> >

Yeah. I'll shift further discussion of this to a KTAP proposal: I
don't want to derail this thread too much further.

We'll keep looking at fully in-kernel ways of achieving similar things
in the meantime.

Cheers,
-- David

> > -Frank
> >
> >>
> >> Cheers,
> >> -- David
> >>
> >>>>
> >>>>>
> >>>>> Hmm... I'd've thought that shouldn't be a problem: kunit.py should
> >>>>> ignore most messages during a test, unless it can't find a valid
> >>>>> result line. What does the raw KTAP output look like? (You can get it
> >>>>> from kunit.py by passing the --raw_output option).
> >>>>>
> >>>>> That being said, a KUNIT_EXPECT_LOG_MESSAGE() or similar is something
> >>>>> we've wanted for a while. I think that the KASAN folks have been
> >>>>> working on something similar using console tracepoints:
> >>>>> https://lore.kernel.org/all/ebf96ea600050f00ed567e80505ae8f242633640.1666113393.git.andreyknvl@google.com/
> >>>>>
> >>>>> Cheers,
> >>>>> -- David
> >>>>
> >>>
> >
>

--000000000000cba5c105f6fcb779
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIPnwYJKoZIhvcNAQcCoIIPkDCCD4wCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ggz5MIIEtjCCA56gAwIBAgIQeAMYYHb81ngUVR0WyMTzqzANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA3MjgwMDAwMDBaFw0yOTAzMTgwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFIzIFNNSU1FIENBIDIwMjAwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCvLe9xPU9W
dpiHLAvX7kFnaFZPuJLey7LYaMO8P/xSngB9IN73mVc7YiLov12Fekdtn5kL8PjmDBEvTYmWsuQS
6VBo3vdlqqXZ0M9eMkjcKqijrmDRleudEoPDzTumwQ18VB/3I+vbN039HIaRQ5x+NHGiPHVfk6Rx
c6KAbYceyeqqfuJEcq23vhTdium/Bf5hHqYUhuJwnBQ+dAUcFndUKMJrth6lHeoifkbw2bv81zxJ
I9cvIy516+oUekqiSFGfzAqByv41OrgLV4fLGCDH3yRh1tj7EtV3l2TngqtrDLUs5R+sWIItPa/4
AJXB1Q3nGNl2tNjVpcSn0uJ7aFPbAgMBAAGjggGKMIIBhjAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0l
BBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFHzM
CmjXouseLHIb0c1dlW+N+/JjMB8GA1UdIwQYMBaAFI/wS3+oLkUkrk1Q+mOai97i3Ru8MHsGCCsG
AQUFBwEBBG8wbTAuBggrBgEFBQcwAYYiaHR0cDovL29jc3AyLmdsb2JhbHNpZ24uY29tL3Jvb3Ry
MzA7BggrBgEFBQcwAoYvaHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvcm9vdC1y
My5jcnQwNgYDVR0fBC8wLTAroCmgJ4YlaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9yb290LXIz
LmNybDBMBgNVHSAERTBDMEEGCSsGAQQBoDIBKDA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5n
bG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzANBgkqhkiG9w0BAQsFAAOCAQEANyYcO+9JZYyqQt41
TMwvFWAw3vLoLOQIfIn48/yea/ekOcParTb0mbhsvVSZ6sGn+txYAZb33wIb1f4wK4xQ7+RUYBfI
TuTPL7olF9hDpojC2F6Eu8nuEf1XD9qNI8zFd4kfjg4rb+AME0L81WaCL/WhP2kDCnRU4jm6TryB
CHhZqtxkIvXGPGHjwJJazJBnX5NayIce4fGuUEJ7HkuCthVZ3Rws0UyHSAXesT/0tXATND4mNr1X
El6adiSQy619ybVERnRi5aDe1PTwE+qNiotEEaeujz1a/+yYaaTY+k+qJcVxi7tbyQ0hi0UB3myM
A/z2HmGEwO8hx7hDjKmKbDCCA18wggJHoAMCAQICCwQAAAAAASFYUwiiMA0GCSqGSIb3DQEBCwUA
MEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24gUm9vdCBDQSAtIFIzMRMwEQYDVQQKEwpHbG9iYWxTaWdu
MRMwEQYDVQQDEwpHbG9iYWxTaWduMB4XDTA5MDMxODEwMDAwMFoXDTI5MDMxODEwMDAwMFowTDEg
MB4GA1UECxMXR2xvYmFsU2lnbiBSb290IENBIC0gUjMxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzAR
BgNVBAMTCkdsb2JhbFNpZ24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDMJXaQeQZ4
Ihb1wIO2hMoonv0FdhHFrYhy/EYCQ8eyip0EXyTLLkvhYIJG4VKrDIFHcGzdZNHr9SyjD4I9DCuu
l9e2FIYQebs7E4B3jAjhSdJqYi8fXvqWaN+JJ5U4nwbXPsnLJlkNc96wyOkmDoMVxu9bi9IEYMpJ
pij2aTv2y8gokeWdimFXN6x0FNx04Druci8unPvQu7/1PQDhBjPogiuuU6Y6FnOM3UEOIDrAtKeh
6bJPkC4yYOlXy7kEkmho5TgmYHWyn3f/kRTvriBJ/K1AFUjRAjFhGV64l++td7dkmnq/X8ET75ti
+w1s4FRpFqkD2m7pg5NxdsZphYIXAgMBAAGjQjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8E
BTADAQH/MB0GA1UdDgQWBBSP8Et/qC5FJK5NUPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOCAQEA
S0DbwFCq/sgM7/eWVEVJu5YACUGssxOGhigHM8pr5nS5ugAtrqQK0/Xx8Q+Kv3NnSoPHRHt44K9u
bG8DKY4zOUXDjuS5V2yq/BKW7FPGLeQkbLmUY/vcU2hnVj6DuM81IcPJaP7O2sJTqsyQiunwXUaM
ld16WCgaLx3ezQA3QY/tRG3XUyiXfvNnBB4V14qWtNPeTCekTBtzc3b0F5nCH3oO4y0IrQocLP88
q1UOD5F+NuvDV0m+4S4tfGCLw0FREyOdzvcya5QBqJnnLDMfOjsl0oZAzjsshnjJYS8Uuu7bVW/f
hO4FCU29KNhyztNiUGUe65KXgzHZs7XKR1g/XzCCBNgwggPAoAMCAQICEAHHLXCbS0CYcocWQtL1
FY8wDQYJKoZIhvcNAQELBQAwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYt
c2ExKjAoBgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjMgU01JTUUgQ0EgMjAyMDAeFw0yMzAxMjkw
NjQ2MThaFw0yMzA3MjgwNjQ2MThaMCQxIjAgBgkqhkiG9w0BCQEWE2RhdmlkZ293QGdvb2dsZS5j
b20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC+31G8qfgjYj6KzASqulKfP5LGLw1o
hZ6j8Uv9o+fA+zL+2wOPYHLNIb6jyAS16+FwevgTr7d9QynTPBiCGE9Wb/i2ob9aBcupQVtBjlJZ
I6qUXdVBlo5zsORdNV7/XEqlpu+X5MK5gNHlWhe8gNpAhADSib2H4rjBvFF2yi9BHBAYZU95f0IN
cSS0WDNSSCktPaXtAGsI3tslroyjFYUluwGklmQms/tV8f/52zc7A5lzX+hxnnJdsRgirJRI9Sb6
Uypzk06KLxOO2Pg9SFn6MwbAO6LuInpokhxcULUz3g/CMQBmEMSEzPPnfDIAqwDI0Kqh0NAin+V4
fQxJfDCZAgMBAAGjggHUMIIB0DAeBgNVHREEFzAVgRNkYXZpZGdvd0Bnb29nbGUuY29tMA4GA1Ud
DwEB/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwHQYDVR0OBBYEFJyglaiY
64VRg2IjDI2fJVE9RD6aMEwGA1UdIARFMEMwQQYJKwYBBAGgMgEoMDQwMgYIKwYBBQUHAgEWJmh0
dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQCMAAwgZoGCCsG
AQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9jYS9n
c2F0bGFzcjNzbWltZWNhMjAyMDBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5nbG9iYWxzaWdu
LmNvbS9jYWNlcnQvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3J0MB8GA1UdIwQYMBaAFHzMCmjXouse
LHIb0c1dlW+N+/JjMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20v
Y2EvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3JsMA0GCSqGSIb3DQEBCwUAA4IBAQA2lZLYRLu7foeR
cHo1VeNA974FZBiCm08Kd44/aCMEzdTJvxAE9xbUJf7hS1i6eW49qxuSp3/YLn6U7uatwAcmZcwp
Zma19ftf3LH+9Hvffk+X8fbPKe6uHkJhR2LktrhRzF159jj67NvXyGQv8J4n7UNeEVP0d5ByvRwv
tF2bJwlOwRGLoxasKSyDHIyUpwTfWYPq7XvjoGqQ/tDS7Khcc5WncJl0/ZEj7EKjtoGbsDbLdXEF
m/6vdcYKJzF9ghHewtV3YIU4RE3pEM4aCWWRtJwbExzeue6fI7RqURbNCAyQuSpWv0YQvzsX3ZX3
c1otrs50n1N0Sf8/rfJxq7sWMYICajCCAmYCAQEwaDBUMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQ
R2xvYmFsU2lnbiBudi1zYTEqMCgGA1UEAxMhR2xvYmFsU2lnbiBBdGxhcyBSMyBTTUlNRSBDQSAy
MDIwAhABxy1wm0tAmHKHFkLS9RWPMA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCCk
QKttta0vKO3EEV4E7xigoxV1tFPqhlRw1Poiw2FVUjAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0yMzAzMTYwNDE1NTlaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEApQ2vC1vu9ou/04tEx2Dp
YkIk2v8ktgSTc+vWbBCVXtkhgqWVRdmrYVbHdvm0G/PnjQ9X6S+Pbmzb5m641PseGutF3Est6zYJ
AfcIfY1dRrmwGrFd0BL4qqO1Wg90tsltz0TqPC303RV1M0g2TLAw+602e7oGnYqBkBP8WBaJgGC6
PGqf8I9J39rCDv9+QfpsKgP1WB8BGQfbtpWQsPiSfxHXKEMlKST8VK+JcIOuTPDhZMmcLAEe6STq
WNYBfDPn/s4gx220mmTeg5wcJrQUft/eMNQ4/ZYFoFaXEBJXBG7/TXVs+h6D2x5Ydrfn/F38qM7Y
J9iygyNo7dDBrJHSdw==
--000000000000cba5c105f6fcb779--
